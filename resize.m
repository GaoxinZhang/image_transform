
    % 图像批量改大小 
clc;
clear;
close all;

readdir='C:\Users\Hancy\Desktop\Zhang\JPEGImages';

    % 写入图像格式  
    writetype = 'jpg';  
    % 写入图像目录，直接附加在读取目录后加上"png resize"  
    writedir = [readdir,' resize'];  
    % 大小改变因子，有两种表示方法，比例或者尺寸  
    %resizefactor = 0.2451;  
    resizefactor = [600 600];  
    % 创建改大小之后图像目录，如果目录已经存在会报警告，但是不影响使用  
    mkdir(writedir);  
    % 读取目录内所有所有图像目录信息  
    imnames = dir(readdir);  
    % 去掉目录信息中的无用项( . .. )  
    imnames(1:2)=[];  
    % 统计图像个数  
    imcnt=length(imnames);  
    % 针对每一个图像  
    for imidx = 1:1:imcnt  
        % 读入图像  
        imtemp = imread(fullfile(readdir,imnames(imidx).name));  
        % 改变图像大小  
        imtemp = imresize(imtemp,resizefactor);  
        % 按照需要格式写入图像  
        imwrite(imtemp,fullfile(writedir,[imnames(imidx).name(1:end-3),writetype]));  
    end   