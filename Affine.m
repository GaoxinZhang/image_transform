function [img_trans] = Affine(img,affine_form)
%UNTITLED2 ¶ÔÍ¼Ïñ×ö·ÂÉä±ä»»
 tform_translate = maketform('affine', affine_form);
[img_trans xdata ydata]= imtransform(img, tform_translate);
end

