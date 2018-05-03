clear;
clc;

file_path_input_1 = 'D:\train_image\rot00_generate\';
file_path_input_2 = 'D:\train_image\rot40_generate\';
file_path_input_3 = 'D:\train_image\rot20_generate\';
file_path_input_4 = 'D:\train_image\rot40_generate\';
file_path_input_5 = 'D:\train_image\rot45_generate\';
file_path_input_6 = 'D:\train_image\rot50_generate\';
file_path_input_7 = 'D:\train_image\rot70_generate\';
file_path_input_8 = 'D:\train_image\rot80_generate\';

file_path_output = 'D:\train_image\rot40_combine\';

img_file_list_1 = dir([file_path_input_1, '*.jpg']);
num_img_files_1 = length(img_file_list_1);

img_file_list_2 = dir([file_path_input_2, '*.jpg']);
num_img_files_2 = length(img_file_list_2);

for k = 1:num_img_files_1
    %system(['rename' [num2str(k), '_prjctv_trans1.jpg']  [num2str(k), '.jpg']]);
    %ori_filename = [file_path_input_1 img_file_list_1(k).name];
    %rot_filename = [file_path_input_2 img_file_list_2(k).name];
    %new_filename = [file_path_output,num2str(k),'.jpg'];
     %img_ori = imread(ori_filename);
     %img_rot = imread(rot_filename);
    img_ori=imread( [file_path_input_1 img_file_list_1(k).name] );
    img_rot=imread( [file_path_input_2 img_file_list_2(k).name] );
%     if numel(size(img_vis))>2
%         img_vis = rgb2gray(img_vis);    
%     else
%         img_vis = img_vis;
%     end
%     
%     
%     if numel(size(img_inf))>2
%         img_inf = rgb2gray(img_inf); 
%     else
%         img_inf = img_inf;
%     end
    
    img_comb = zeros([size(img_ori), 3], 'like', img_ori);
    
    img_comb(:,:,1) = img_ori;
    img_comb(:,:,2) = img_rot;
    
    imwrite(img_comb, [file_path_output img_file_list_2(k).name(1:end-4) '.jpg'] );
    
    %eval(['!rename' 32 old_filename 32 new_filename]);
end
