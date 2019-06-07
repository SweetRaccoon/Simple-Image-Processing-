function [Ireg,O_trans,Spacing,M,B,F] = test(~,~)

Imoving=imread('disLR.png');
Istatic=imread('disLR.png');

load('disLR.png');
load('disRL.png');

Options = struct('Points1',Points1,'Points2',Points2,'PStrength',PStrength);
Ireg = image_registration(Imoving,Istatic,Options);

figure, imshow(Imoving+Istatic,[]);

figure, imshow(Ireg+Istatic,[]);


