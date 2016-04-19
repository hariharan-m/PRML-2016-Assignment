clear all;
warning off;
reg = 0.4; %Lamda for Regularising
addr_a='/home/hariharan/PRML/TrainCharacters/1';
addr_b='/home/hariharan/PRML/TrainCharacters/2';
addr_c='/home/hariharan/PRML/TrainCharacters/3';

[ma ca] = mc1(addr_a);
[mb cb] = mc1(addr_b);
[mc cc] = mc1(addr_c);

a_a=0;%Variables for counting the images classified to a certain class
a_b=0;
a_c=0;

b_a=0;
b_b=0;
b_c=0;

c_a=0;
c_b=0;
c_c=0;

I=eye(1024,1024);%C = I
ia=I;
ib=I;
ic=I;

detc_a=det(ca+(reg*I));
detc_b=det(cb+(reg*I));
detc_c=det(cc+(reg*I));

awb=[];
awc=[];
bwa=[];
bwc=[];
cwa=[];
cwb=[];

cd('/home/hariharan/PRML/TestCharacters/TestCharacters/1');
for i=201:300
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    x=double(tImg);
    x=reshape(x,1024,1);
    dis_a = log(detc_a^(-0.5))+(-1/2*(x-ma)'*ia*(x-ma));
    dis_b = log(detc_b^(-0.5))+(-1/2*(x-mb)'*ib*(x-mb));
    dis_c = log(detc_c^(-0.5))+(-1/2*(x-mc)'*ic*(x-mc));
    
    dis=[dis_a dis_b dis_c];
    maxdis=max(dis);
    if(maxdis==dis_a)
        a_a=a_a+1;
    elseif(maxdis==dis_b)
            a_b=a_b+1;
            awb=[awb;i];
    else
        a_c=a_c+1;
        awc=[awc;i];
    end    
end

cd('/home/hariharan/PRML/TestCharacters/TestCharacters/2');
for i=201:300
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    x=double(tImg);
    x=reshape(x,1024,1);
    dis_a = log(detc_a^(-0.5))+(-1/2*(x-ma)'*ia*(x-ma));
    dis_b = log(detc_b^(-0.5))+(-1/2*(x-mb)'*ib*(x-mb));
    dis_c = log(detc_c^(-0.5))+(-1/2*(x-mc)'*ic*(x-mc));
    
    dis=[dis_a dis_b dis_c];
    maxdis=max(dis);
    if(maxdis==dis_a)
        b_a=b_a+1;
        bwa=[bwa;i];
    elseif(maxdis==dis_b)
            b_b=b_b+1;
    else
        b_c=b_c+1;
        bwc=[bwc;i];
    end    
end

cd('/home/hariharan/PRML/TestCharacters/TestCharacters/3');
for i=201:300
    tImgU= imread(sprintf('%d.jpg',i));
    tImg=imresize(tImgU,0.25);
    x=double(tImg);
    x=reshape(x,1024,1);
    dis_a = log(detc_a^(-0.5))+(-1/2*(x-ma)'*ia*(x-ma));
    dis_b = log(detc_b^(-0.5))+(-1/2*(x-mb)'*ib*(x-mb));
    dis_c = log(detc_c^(-0.5))+(-1/2*(x-mc)'*ic*(x-mc));
    
    dis=[dis_a dis_b dis_c];
    maxdis=max(dis);
    if(maxdis==dis_a)
        c_a=c_a+1;
        cwa=[cwa;i];
    elseif(maxdis==dis_b)
            c_b=c_b+1;
            cwb=[cwb;i];
    else
        c_c=c_c+1;
    end    
end
clc
report=[a_a a_b a_c;b_a b_b b_c;c_a c_b c_c];
fprintf('Result\n');
display(report);
fprintf('A misclassified as B\n');
display(awb');
fprintf('A misclassified as C\n');
display(awc');
fprintf('B misclassified as A\n');
display(bwa');
fprintf('B misclassified as C\n');
display(bwc');
fprintf('C misclassified as A\n');
display(cwa');
fprintf('C misclassified as B\n');
display(cwb');
cd('/home/hariharan/PRML/Prob 1')