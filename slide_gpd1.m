function [sol]= slide_gpd1(path,intrvl)
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);

allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
idx(1);
i=1;
pp=30;
sol=0;
Rn=0;
%{
while (i+pp)<=max(idx)-3
    j=i+pp;
%}
    while (i+1)<=max(idx)-3
        if(i+pp)<max(idx)-3
           j=i+pp;
        else
            j=max(idx)-3;
        end
    %{
    1
    allFiles(idx(j)).name
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
 if(f>=0.03)
     %}
    [s1 k]=gpd2(filepath1, allFiles,idx,i,i,j,j);
    
   % s=nonzeros(s1)
    %        s= sort(s);
            
             if s1>i %any(s)&&(s(1)>i)
                 i=s1;%s(1);
                 sol=[sol s1];%(1)]
             else
                 i=k;
             end
          
             
             
             %{
else
     i=j;
 end
             %}
 
end
end

