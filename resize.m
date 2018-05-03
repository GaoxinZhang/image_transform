
    % ͼ�������Ĵ�С 
clc;
clear;
close all;

readdir='C:\Users\Hancy\Desktop\Zhang\JPEGImages';

    % д��ͼ���ʽ  
    writetype = 'jpg';  
    % д��ͼ��Ŀ¼��ֱ�Ӹ����ڶ�ȡĿ¼�����"png resize"  
    writedir = [readdir,' resize'];  
    % ��С�ı����ӣ������ֱ�ʾ�������������߳ߴ�  
    %resizefactor = 0.2451;  
    resizefactor = [600 600];  
    % �����Ĵ�С֮��ͼ��Ŀ¼�����Ŀ¼�Ѿ����ڻᱨ���棬���ǲ�Ӱ��ʹ��  
    mkdir(writedir);  
    % ��ȡĿ¼����������ͼ��Ŀ¼��Ϣ  
    imnames = dir(readdir);  
    % ȥ��Ŀ¼��Ϣ�е�������( . .. )  
    imnames(1:2)=[];  
    % ͳ��ͼ�����  
    imcnt=length(imnames);  
    % ���ÿһ��ͼ��  
    for imidx = 1:1:imcnt  
        % ����ͼ��  
        imtemp = imread(fullfile(readdir,imnames(imidx).name));  
        % �ı�ͼ���С  
        imtemp = imresize(imtemp,resizefactor);  
        % ������Ҫ��ʽд��ͼ��  
        imwrite(imtemp,fullfile(writedir,[imnames(imidx).name(1:end-3),writetype]));  
    end   