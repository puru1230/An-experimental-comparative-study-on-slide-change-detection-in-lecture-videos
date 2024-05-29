function [hd kkk]= hist_diff(path,intrvl)

filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);
allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
%allFiles(idx(1));
k = 1;
p=1;
f1=0;
f=0;
kkk=0;

I=imread(strcat(filepath1,num2str(allFiles(idx(1)).name)));

Imageg1 = rgb2gray(I);
hn1 = imhist(Imageg1)./numel(Imageg1);

i=2;
hd=0;
while i<=max(idx)-3
    I=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
    Imageg1 = rgb2gray(I);
	hn2 = imhist(Imageg1)./numel(Imageg1);
    f(k) = sum((hn1 - hn2).^2);
    kkk=[ kkk f(k)];
        if(f(k)>=0.0001)
            hd=[hd i] ;  
         hn1=hn2;
        end
    i=i+intrvl;
    k = k+1;
end
