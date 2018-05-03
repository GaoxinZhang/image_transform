%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% image_transformation.m
% 包含函数文件（fct_getCenterArea.m）
% 对图像进行平移 旋转 仿射变换后从图像中心处截取同一尺寸的图像
% 5-2-2017 Created
% Author:Fan Wang, Gaoxin Zhang
% Note, MUST make this file has the COMPLETELY same setups with the files
% mentioned above
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%%%原图片与经过操作剪裁后的图像存放的目录%%%%%%%%%%%%%%%%%%%%
%此处设置原图目录
img_src_dir = 'D:\train_image\';
src_ori_img_dir = fullfile( img_src_dir,'source\' );

%此处设置图像生成目录
img_generate_dir = 'D:\train_image\';
% src_clip_dir = fullfile( img_generate_dir,'exp_1\' );
% trans_clip_dir = fullfile( img_generate_dir,'exp_2\' ); 
% rot_clip_dir = fullfile( img_generate_dir,'exp_3\' ); 
% affine_clip_dir = fullfile( img_generate_dir,'exp_4\' ); 

src_clip_dir = fullfile( img_generate_dir,'src_crop\' );
trans_clip_dir = fullfile( img_generate_dir,'trans_generate\' ); 
affine_clip_dir = fullfile( img_generate_dir,'affine_generate\' ); 
rot15_clip_dir = fullfile( img_generate_dir,'rot15_generate\' ); 
rot20_clip_dir = fullfile( img_generate_dir,'rot20_generate\' );
rot40_clip_dir = fullfile( img_generate_dir,'rot40_generate\' );
rot45_clip_dir = fullfile( img_generate_dir,'rot45_generate\' );
rot50_clip_dir = fullfile( img_generate_dir,'rot50_generate\' );
rot70_clip_dir = fullfile( img_generate_dir,'rot70_generate\' ); 
rot80_clip_dir = fullfile( img_generate_dir,'rot80_generate\' );
rot08_clip_dir = fullfile( img_generate_dir,'rot08_generate\' );
rot09_clip_dir = fullfile( img_generate_dir,'rot09_generate\' );
rot10_clip_dir = fullfile( img_generate_dir,'rot10_generate\' );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

src_img_files = dir( [src_ori_img_dir '*.JPEG'] );  
src_img_num = length( src_img_files );  

for i = 1:src_img_num  
    src = imread( [src_ori_img_dir src_img_files(i).name] );
    
    %在计算图像长与宽前需将其转换为灰度图像    
    img_size = size( src );
    if numel( img_size )>2
        img_gray = rgb2gray( src );
    else
        continue;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [temp_length,temp_width]=size( img_gray );%获得图像矩阵的行数和列数
    if( temp_length>=300 && temp_width>=300 )%若图像尺寸大于（375*375），则对图像进行处理
        
        src = rgb2gray( src );%转换为灰度图像
        crop_size_x = 128;
        crop_size_y = 128;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%原图裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %src_crop = fct_getCenterArea(src,crop_size_x,crop_size_y);
        %imwrite( src_crop, [rot00_clip_dir 'rot00' src_img_files(i).name(19:end-5) '.jpg'] );
        %截取中间尺寸为128*128的区域
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %变换矩阵T为：
%         %|sx  shx  tx|
%         %|shy  sy  ty|
%         %|0    0   1 |
%         %其中sx,sy表示伸缩，shx,shy表示变形，tx,ty表示位移。
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%平移后裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %将每一点移动到（x+delta_x，y+delta_y）
%         delta_x = 15;
%         delta_y = 15;
%         
%         trans_form= [ 1      0         0
%             0      1         0
%             delta_x  delta_y     1   ];
%         
%         tform_trans = maketform( 'affine', trans_form );
%         img_trans = imtransform( src,tform_trans,'XData',[1 413],'YDATA',[1 310],'FillValue',0.5 );
%         
%         im_crop_dilate = fct_getCenterArea( img_trans,224,224 );
%         imwrite( im_crop_dilate,[trans_clip_dir 'trans' src_img_files(i).name(19:end-5) '.JPEG'] );
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%旋转后裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %将图片旋转theta
        
        theta = 5*pi/18;%#1 50°
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot50_clip_dir 'rot50' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%旋转后裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %将图片旋转theta
        
        theta = 7*pi/18;%#2 70°
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot70_clip_dir 'rot70' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%旋转后裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %将图片旋转theta
        
        theta = 4*pi/9;%#3 80°
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot80_clip_dir 'rot80' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%仿射变换后裁剪%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         
%         affine_form = [ 1   0.2  0
%             0.2   1   0
%             0    0   1 ];
%         
%         tform_translate = maketform( 'affine', affine_form );
%         [img_affine,xdata,ydata] = imtransform( src, tform_translate );
%         %imshow(img_affine);
%         im_crop_affine = fct_getCenterArea(img_affine,224,224 );
%         imwrite( im_crop_affine,[affine_clip_dir 'affine' src_img_files(i).name(19:end-5) '.JPEG'] );
% 
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        clear src;
    else
        clear src;
        continue;
    end
end



