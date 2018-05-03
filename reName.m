%重命名图片。按顺序重命名为1,2,3,4....
s_path = 'D:\peizhun\20160910\vis\vis_2\';
d_path = 'D:\peizhun\20160910\vis\vis2\';
file=dir([s_path,'*.jpg']);
for n=1:length(file)
%     image = imread([s_path,file(n).name]);
%     imwrite(image,[d_path,num2str(n),'.jpg'],'jpg');
    oldname = [s_path, file(n).name];
    newname = [d_path, num2str(n), '.jpg'];
    movefile(oldname, newname);
end