cd('/home/hariharan/PRML Ass/');
cd('TrainCharacters/');
samplen=200;
%For E
cd 1    
mA=zeros(32,32);
tImgU=zeros(128,128);
tImg=zeros(32,32);

for i=1:samplen
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    mA=mA+tImg;
end