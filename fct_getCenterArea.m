function [im_crop] = fct_getCenterArea(img,im_clip_length,im_clip_width)
%计算图像中心点,并截取以图像中心点为中心的length*width大小的图像
%取中心点

img_size = size( img );
if numel( img_size )>2
    im_gray = rgb2gray( img );
else
    im_gray = img;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%计算图像中心点%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%方法一%%%%%%%%%%%%%%%%%%
% L = bwlabel( im_gray );
% stats = regionprops( L, 'Centroid' ); 
% hold on; 
% 
% for i = 1:length( stats ) 
%     temp = stats(i).Centroid;
%     %plot( temp(1), temp(2), 'r.' );
% end
% 
% center_point_x = temp(1);%保存中心点横坐标
% center_point_y = temp(2);%保存中心点纵坐标

%%%%%%%%%%%%%%%%%方法二%%%%%%%%%%%%%%%%%%
[temp_width,temp_length]=size( im_gray );
%计算图像的中心点坐标x
center_point_x=temp_length/2;
% if mod( temp_length,2 ) == 0
%     center_point_x=temp_length/2;
% else
%     temp_length=temp_length+1;
%     center_point_x=temp_length/2;
% end
%计算图像的中心点坐标y
center_point_y=temp_width/2;
% if mod( temp_width,2 ) == 0
%     center_point_y=temp_width/2;
% else
%     temp_width=temp_width+1;
%     center_point_y=temp_width/2;
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = im_clip_length/2;
n = im_clip_width/2;
%起点坐标为(a-m，b-n),以起点坐标为左上角截取length*width大小的图像
im_crop = imcrop( img,[center_point_x-m center_point_y-n im_clip_length-1 im_clip_width-1] );

end

