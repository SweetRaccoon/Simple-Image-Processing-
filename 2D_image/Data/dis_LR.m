X = dicomread('distortedLR.dcm');
info = dicominfo('distortedLR.dcm');
Y = dicomread(info);
figure
imshow(Y,[]);