function [sol]= gpd_check(filepath1,allFiles,idx,i,j)
%{
%vidObj = VideoReader('dataset/How Data Minng works or The KDD Process.mp4');
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);% allFiles = dir('dataset/interrupts1/frames/')
%allFiles = dir( 'dataset/Similarity and KNN lecture/frames' );
allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
allFiles(idx(1));
k = 1;
p=1;
f1=0;
f=0;
kkk=0;
%vidObj.CurrentTime=0;
%}
i;
j;
sol=0;
I=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
I1=imread(strcat(filepath1,num2str(allFiles(idx(j)).name)));
%I=imread(strcat('dataset/Similarity and KNN lecture/frames/',num2str(allFiles(idx(1)).name)));
%l=rgb2gray(I);

l=im2bw(I,0.5);
 m=im2bw(I1,0.5);
 r=imsubtract(l,m);
 p=size(r,1);
 q=size(r,2);
 f=(nnz(r)/(p*q))
 
 end

