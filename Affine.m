function [img_trans] = Affine(img,affine_form)
%UNTITLED2 ��ͼ��������任
 tform_translate = maketform('affine', affine_form);
[img_trans xdata ydata]= imtransform(img, tform_translate);
end

