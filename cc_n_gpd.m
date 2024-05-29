function [gpd cc1 kkk]= cc_n_gpd(path,intrvl)
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
l1=l;
cmp=0;
i=2;
cc=0;
cc1=0;
gpd=0;
while i<=max(idx)-3
    I=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
    %I=imread(strcat('dataset/Similarity and KNN lecture/frames/',num2str(allFiles(idx(i)).name)));
    
    allFiles(idx(i)).name;
   
     c = I;
   % m=rgb2gray(I);
    
    m=im2bw(I,0.5);
    m1=m;
    r=imsubtract(l,m);
    r1=imsubtract(l1,m1);
        %{ 
        Imaged2 = im2double(c);
       
        Imageg2 = rgb2gray(Imaged2);
        
      
        Imaged22 = im2double(c1);
      
        Imageg22 = rgb2gray(Imaged22);
% Calculate the Normalized Histogram of Image 1 and Image 2
      
        hn2 = imhist(Imageg2)./numel(Imageg2);
        
        %CC2=bwconncomp(edge(Imageg22,'canny'));
        CC2=bwconncomp(edge(Imageg2,'canny'));
        f(k) = sum(abs(hn1 - hn2));
        %f(k) = sum((hn1 - hn2).^2);
        f1(k)=CC1.NumObjects-CC2.NumObjects;
        cc1(k)=CC1.NumObjects;
        cc2(k)=CC2.NumObjects;
        %{
        hh1(k)=hn1;
        hh2(k)=hn2;
%}
     %}
    C1=0;
    p=size(r,1);
    q=size(r,2);
    f(k)=(nnz(r)/(p*q));
	
    C1=bwconncomp(edge(l1,'canny',0.5));
    C2=bwconncomp(edge(m1,'canny',0.5));
	%{
d1=edge(l1,'canny',0.5)-edge(l1,'canny',0.5);
    C1=bwconncomp(edge(d1,'canny',0.5));
	%}
	f1(k)=C1.NumObjects-C2.NumObjects;
%f1(k)=C1.NumObjects;
    kkk=[ kkk f1(k)];
        if(f(k)>=0.03)
            %if(f(k)>=0.0002)
           % intrvl
		   
       % imwrite(c,strcat(filepath2,'/framess/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
        %imwrite(c,strcat('dataset/Similarity and KNN lecture/framess/fcc/frames1_1/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
           gpd=[gpd i] ;  
         l=m;
       
        end
    %  l=m;
        if(abs(f1(k))>=20)
       % imwrite(c,strcat(filepath2,'/framess/frames',num2str(intrvl),'_2/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
        %imwrite(c,strcat('dataset/Similarity and KNN lecture/framess/fcc/frames1_2/',num2str(allFiles(idx(i)).name)));%strrep(num2str(round(vidObj.CurrentTime/60,3)),'.','_'),'.jpg'));
        l1=m1;
        cc(k)=f1(k);
		cc1=[cc1 i];
        end
       % l1=m1;
    
   %i=i+1;
    i=i+intrvl;
   
    k = k+1;
    
end
%{
f=0;
f1=0;
for i=1:k-1
Imaged1 = im2double(s(i).cdata);
Imaged2 = im2double(s(i+1).cdata);

% reduce three channel [ RGB ]  to one channel [ grayscale ]
Imageg1 = rgb2gray(Imaged1);
Imageg2 = rgb2gray(Imaged2);
% Calculate the Normalized Histogram of Image 1 and Image 2
hn1 = imhist(Imageg1)./numel(Imageg1);
hn2 = imhist(Imageg2)./numel(Imageg2);
CC1=bwconncomp(edge(Imageg1,'canny'));
CC2=bwconncomp(edge(Imageg2,'canny'));
f(i) = sum((hn1 - hn2).^2);
f1(i)=CC1.NumObjects-CC2.NumObjects;
end


vidWidth = xyloObj.Width;
vidHeight = xyloObj.Height;
mov = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),...
    'colormap',[]);
k = 1;
while hasFrame(xyloObj)
    mov(k).cdata = readFrame(xyloObj);
    k = k+1;
end

hf = figure;
set(hf,'position',[150 150 vidWidth vidHeight]);

movie(hf,mov,1,xyloObj.FrameRate);
%}