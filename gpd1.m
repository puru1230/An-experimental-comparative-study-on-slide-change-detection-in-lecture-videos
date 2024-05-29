function [gpd idx]= gpd1(path,intrvl)
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
I=imread(strcat(filepath1,num2str(allFiles(idx(1)).name)));
%I=imread(strcat('dataset/Similarity and KNN lecture/frames/',num2str(allFiles(idx(1)).name)));

%l=rgb2gray(I);
l=im2bw(I,0.5);
cmp=0;
i=2;

gpd=0;
while i<=max(idx)-3
    I=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
    %I=imread(strcat('dataset/Similarity and KNN lecture/frames/',num2str(allFiles(idx(i)).name)));
   % i
   % allFiles(idx(i)).name;
   
     c = I;
   % m=rgb2gray(I);
    
    m=im2bw(I,0.5);
  
    r=imsubtract(l,m);
   
        
    C1=0;
    p=size(r,1);
    q=size(r,2);
    f=(nnz(r)/(p*q));
	
    
        if(f>=0.03)
            %if(f(k)>=0.0002)
           % intrvl
		  allFiles(idx(i)).name ;
       % imwrite(c,strcat(filepath2,'/framess/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
        %imwrite(c,strcat('dataset/Similarity and KNN lecture/framess/fcc/frames1_1/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
           gpd=[gpd i]   ;
         l=m;
       
        end
   
       % l1=m1;
    
   %i=i+1;
    i=i+intrvl;
   
   
    
end
