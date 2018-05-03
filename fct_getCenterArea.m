function [im_crop] = fct_getCenterArea(img,im_clip_length,im_clip_width)
%����ͼ�����ĵ�,����ȡ��ͼ�����ĵ�Ϊ���ĵ�length*width��С��ͼ��
%ȡ���ĵ�

img_size = size( img );
if numel( img_size )>2
    im_gray = rgb2gray( img );
else
    im_gray = img;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%����ͼ�����ĵ�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%����һ%%%%%%%%%%%%%%%%%%
% L = bwlabel( im_gray );
% stats = regionprops( L, 'Centroid' ); 
% hold on; 
% 
% for i = 1:length( stats ) 
%     temp = stats(i).Centroid;
%     %plot( temp(1), temp(2), 'r.' );
% end
% 
% center_point_x = temp(1);%�������ĵ������
% center_point_y = temp(2);%�������ĵ�������

%%%%%%%%%%%%%%%%%������%%%%%%%%%%%%%%%%%%
[temp_width,temp_length]=size( im_gray );
%����ͼ������ĵ�����x
center_point_x=temp_length/2;
% if mod( temp_length,2 ) == 0
%     center_point_x=temp_length/2;
% else
%     temp_length=temp_length+1;
%     center_point_x=temp_length/2;
% end
%����ͼ������ĵ�����y
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
%�������Ϊ(a-m��b-n),���������Ϊ���Ͻǽ�ȡlength*width��С��ͼ��
im_crop = imcrop( img,[center_point_x-m center_point_y-n im_clip_length-1 im_clip_width-1] );

end

