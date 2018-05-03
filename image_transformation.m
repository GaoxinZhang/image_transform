%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% image_transformation.m
% ���������ļ���fct_getCenterArea.m��
% ��ͼ�����ƽ�� ��ת ����任���ͼ�����Ĵ���ȡͬһ�ߴ��ͼ��
% 5-2-2017 Created
% Author:Fan Wang, Gaoxin Zhang
% Note, MUST make this file has the COMPLETELY same setups with the files
% mentioned above
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%%%%%%%%%%%%%%%%%%%%%ԭͼƬ�뾭���������ú��ͼ���ŵ�Ŀ¼%%%%%%%%%%%%%%%%%%%%
%�˴�����ԭͼĿ¼
img_src_dir = 'D:\train_image\';
src_ori_img_dir = fullfile( img_src_dir,'source\' );

%�˴�����ͼ������Ŀ¼
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
    
    %�ڼ���ͼ�����ǰ�轫��ת��Ϊ�Ҷ�ͼ��    
    img_size = size( src );
    if numel( img_size )>2
        img_gray = rgb2gray( src );
    else
        continue;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [temp_length,temp_width]=size( img_gray );%���ͼ����������������
    if( temp_length>=300 && temp_width>=300 )%��ͼ��ߴ���ڣ�375*375�������ͼ����д���
        
        src = rgb2gray( src );%ת��Ϊ�Ҷ�ͼ��
        crop_size_x = 128;
        crop_size_y = 128;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ԭͼ�ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %src_crop = fct_getCenterArea(src,crop_size_x,crop_size_y);
        %imwrite( src_crop, [rot00_clip_dir 'rot00' src_img_files(i).name(19:end-5) '.jpg'] );
        %��ȡ�м�ߴ�Ϊ128*128������
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %�任����TΪ��
%         %|sx  shx  tx|
%         %|shy  sy  ty|
%         %|0    0   1 |
%         %����sx,sy��ʾ������shx,shy��ʾ���Σ�tx,ty��ʾλ�ơ�
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ƽ�ƺ�ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         %��ÿһ���ƶ�����x+delta_x��y+delta_y��
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
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ת��ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %��ͼƬ��תtheta
        
        theta = 5*pi/18;%#1 50��
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot50_clip_dir 'rot50' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ת��ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %��ͼƬ��תtheta
        
        theta = 7*pi/18;%#2 70��
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot70_clip_dir 'rot70' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ת��ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %��ͼƬ��תtheta
        
        theta = 4*pi/9;%#3 80��
        
        rotate_form = [ cos(theta)  -sin(theta)  0
            sin(theta)  cos(theta)   0
            0         0        1 ];
        
        tform_rotate = maketform( 'affine', rotate_form );
        [img_rotate,xdata,ydata] = imtransform( src, tform_rotate );
        
        im_crop_rotate = fct_getCenterArea( img_rotate,crop_size_x,crop_size_y );
        imwrite( im_crop_rotate,[rot80_clip_dir 'rot80' src_img_files(i).name(19:end-5) '.jpg'] );
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
        
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����任��ü�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



