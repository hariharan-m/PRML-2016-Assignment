function [m c]= mc1(address)
cd(address);
samplen=200;

m=zeros(1024,1);
c=zeros(1024,1024);
tImgU=zeros(128,128);
tImg=zeros(32,32);

%-------------MEAN-------------%
for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    m=m+tImg;
end
m=m/samplen;

%-------------COVARIANCE-------------%

for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    ctemp = (tImg - m)*(tImg - m)';
    c=c+ctemp;
end
c=c/samplen;
cd('/home/hariharan/PRML/Prob 1');
