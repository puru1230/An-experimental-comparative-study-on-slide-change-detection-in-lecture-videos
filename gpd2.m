function [sol j] = gpd2(filepath1,allFiles,idx,i,k,s,j)

%k
sol=0;
if(k~=j)
  %{
  i;
    j;
    s;
    %}
I=imread(strcat(filepath1,num2str(allFiles(idx(k)).name)));
I1=imread(strcat(filepath1,num2str(allFiles(idx(j)).name)));
%I=imread(strcat('dataset/Similarity and KNN lecture/frames/',num2str(allFiles(idx(1)).name)));
%l=rgb2gray(I);


l=im2bw(I,0.5);
 m=im2bw(I1,0.5);
 r=imsubtract(l,m);
 p=size(r,1);
 q=size(r,2);
 %{
 i
 j
 %}
 f=(nnz(r)/(p*q));
 if(f>=0.03)
    % 1
 %c=1;
 %if(i+1~=j)
 %{
 i;
 j;
 allFiles(idx(j)).name;
 %}
 c=1;
 %sol=[sol j];
k1=j;
 j=int16((k+j)/2);
 if(k1~=j)
 %sol =[sol gpd2(filepath1,allFiles,idx,i,i,k1,j)];
  sol =gpd2(filepath1,allFiles,idx,i,i,k1,j);
 else
    % sol=[sol k1];
     sol=k1;
 end
 
 else
    % 0
     i=j;
     j=s;
     %{
     i
     j
     %}
   % sol =[sol gpd2(filepath1,allFiles,idx,i,i,j,j)]; 
    sol =gpd2(filepath1,allFiles,idx,i,i,j,j); 
     %{
     0
     k
     j
     k1=k;
     k=int16((k+j)/2);
      if(k1~=k)
   sol =[sol gpd2(filepath1,allFiles,idx,i,k,j)];  
      else
          sol=[sol j];
 end
 %}
 end
 end

