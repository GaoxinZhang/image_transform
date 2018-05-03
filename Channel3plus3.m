I1=imread('affine00003.JPEG');
I2=imread('src00003.JPEG');
I3=I1+I2;
imwrite(I3,'00003.JPEG');
imshow(I3)