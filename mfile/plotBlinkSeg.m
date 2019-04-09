
video_path      = '/Users/wanqiaod/workspace/data/test_video/F005_01.avi';
zface_fit_path  = '/Users/wanqiaod/workspace/data/out/zface_out/zface_fit/F005_01_fit.mat';
out_video_path  = '/Users/wanqiaod/workspace/data/visualization/F005_01_blink.avi';

% load behavioral data
behav_data = '/Users/wanqiaod/workspace/data/aDBS_behav_data/aDBS002_1017_provoc.mat';
load(behav_data)

% Parameter need changes
start_frame = 1;
end_frame   = 661;
debug_mode  = true;
blink_threshold = 0.1;

load(zface_fit_path);
total_frame = size(fit,2);
if end_frame == 0
    end_frame = total_frame;
end

% time course of the plots (x axis)
plot_x   = start_frame:end_frame;
blink    = getBlink(fit,blink_threshold);
avg_dist = blink.avg_dist(start_frame:end_frame);
avg_blink_cnt = blink.avg_blink_cnt(start_frame:end_frame);

% Made up behav data
provoc_behav = data.provoc_behav{1,1};
seg1_behav   = provoc_behav(1:5,:);
seg1_behav{1,5} = 1;
seg1_behav{2,5} = 31;
seg1_behav{3,5} = 331;
seg1_behav{4,5} = 361;
seg1_behav{5,5} = 661;
seg1_behav{2,7} = 279;
seg1_behav{4,7} = 614;

seg_index     = 1:661;
avg_blink_cnt = blink.avg_blink_cnt(seg_index);
avg_dist      = blink.avg_dist(seg_index);

% dimensions of the whole window
window_x0 = 100;
window_y0 = 100;
window_w  = 1000;
window_h  = 700;

% open the original video and output video
orig_video = VideoReader(video_path);
if ~debug_mode
    out_video  = VideoWriter(out_video_path);
    open(out_video);
end

figure
% open the plot window and set background white
set(gcf,'position',[window_x0,window_y0,window_w,window_h])
set(gcf,'color','white');
set(gca,'Clipping','off');
video_pos     = [0.05 0.55 0.25 0.4]; % original video
eye_pnt_pos   = [0.4 0.55 0.2 0.2]; % eye outline landmarks
img_pos       = [0.7 0.55 0.25 0.25]; % provoc image
avg_dist_pos  = [0.1 0.15 0.8 0.08]; % average eyelid distance 
blink_cnt_pos = [0.1 0.05 0.8 0.08]; % average blink count over time

% get the axes for each plot
video_ax     = subplot('Position',video_pos);
eye_pnt_ax   = subplot('Position',eye_pnt_pos);
img_ax       = subplot('Position',img_pos);
avg_dist_ax  = subplot('Position',avg_dist_pos);
blink_cnt_ax = subplot('Position',blink_cnt_pos);

% plot average eyelid distance
plot(avg_dist_ax,plot_x,avg_dist);
axis(avg_dist_ax,'tight');
% plot average blink count
plot(blink_cnt_ax,plot_x,avg_blink_cnt);
axis(blink_cnt_ax,'tight');


% get the height of red time line.
blink_timeline_height = ceil(max(avg_blink_cnt));
dist_timeline_height  = max(avg_dist)+0.05;
% In each iteration: plot orig video frame, eye outline landmarks,
% average eyelid distance, average blink count and moving red line.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load provocation stimulus
curr_seg = 1;
curr_img_fname = '/Users/wanqiaod/workspace/data/aDBS_behav_data/img/1.jpg';
curr_img = imread(curr_img_fname);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for frame_index = start_frame : end_frame
    % plot orig video
    frame_img = orig_video.read(frame_index);
    image(video_ax,frame_img);
    axis(video_ax,'off'); % no axis shown
    % plot eye outline landmarks
    singleface = fit(frame_index).pts_2d;
    singleface = singleface(20:31,:); % eye part landmarks
    scatter(eye_pnt_ax,singleface(:,1),singleface(:,2),'filled');
    axis(eye_pnt_ax,'equal'); % set x/y axes equal scale
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Show provocation image.
    % TO BE IMPLEMENTED: change image as the timeline moves
    image(img_ax,curr_img);
    axis(img_ax,'off');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % plot moving time line.
    blink_timeline = line(blink_cnt_ax,[frame_index frame_index],...
                          [0 blink_timeline_height]);
    dist_timeline  = line(avg_dist_ax,[frame_index frame_index],...
                          [0 dist_timeline_height]);
    % set timeline width and color
    set(blink_timeline,'LineWidth',1,'Color','r');
    set(dist_timeline,'LineWidth',1,'Color','r');
    drawnow
    % get and write the output frame
    frame = getframe(gcf);
    img   = frame2im(frame);
    if ~debug_mode
        writeVideo(out_video,img);
    else
        pause(0.5);
    end
    % delete the timeline after done writing the frame
    set(blink_timeline,'Visible','off');
    set(dist_timeline,'Visible','off');
end

if ~debug_mode
    close(out_video);
end


