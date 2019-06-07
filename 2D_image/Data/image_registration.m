function [Ireg,O_trans,Spacing,M,B,F] = image_registration(~,~)

img1 = dicomread('distortedLR.dcm');
img2 = dicomread('distortedRL.dcm');

% Options = struct('Points1',Points1,'Points2',Points2,'PStrength',PStrength);

[Ireg,O_trans,Spacing,M,B,F] = image_registration(img1,img2);

imshow(img1+img2,[]);
imshow(Ireg+img2,[]);
