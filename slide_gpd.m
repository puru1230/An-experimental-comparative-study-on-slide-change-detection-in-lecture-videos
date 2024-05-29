function [sol]= slide_gpd(path,intrvl)
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);

allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
idx(1);
i=1;
pp=10;
sol=0;
Rn=0;
while (i+pp)<=max(idx)-3
    j=i+pp;
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
    s1=gpd(filepath1, allFiles,idx,i,j)
    
    s=nonzeros(s1)
            s= sort(s)
            

            if any(s)&&(s(1)>i)
                 i=s(1);
                 sol=[sol s(1)];
             else
                 i=i+1;
             end
          
             
             
             %{
else
     i=j;
 end
             %}
 
end
end

