function [finalm c]= mc2()

samplen=200;

m=zeros(1024,1);
c=zeros(1024,1024);
tImgU=zeros(128,128);
tImg=zeros(32,32);
finalm=zeros(1024,1);

%-------------------MEAN----------------------%
%FOR E
cd('/home/hariharan/PRML/TrainCharacters/1');

for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    m=m+tImg;
end
m=m/samplen;

finalm=finalm+m;

%FOR C
cd('/home/hariharan/PRML/TrainCharacters/2');

for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    m=m+tImg;
end
m=m/samplen;

finalm=finalm+m;

%FOR L
cd('/home/hariharan/PRML/TrainCharacters/3');

for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    m=m+tImg;
end
m=m/samplen;

finalm=finalm+m;

finalm=finalm/3;

%-------------------COVARIANCE----------------------%
%FOR E
cd('/home/hariharan/PRML/TrainCharacters/1');
for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    ctemp = (tImg - finalm)*(tImg - finalm)';
    c=c+ctemp;
end

cd('/home/hariharan/PRML/TrainCharacters/2');
for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    ctemp = (tImg - finalm)*(tImg - finalm)';
    c=c+ctemp;
end

cd('/home/hariharan/PRML/TrainCharacters/3');
for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    tImg=double(tImg);
    tImg=reshape(tImg,1024,1);
    ctemp = (tImg - finalm)*(tImg - finalm)';
    c=c+ctemp;
end

c=c/(3*samplen);
cd('/home/hariharan/PRML/Prob 1');
