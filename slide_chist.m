function [cc]= slide_ch(path,intrvl,rate)
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);

allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
allFiles(idx(1));

I=imread(strcat(filepath1,num2str(allFiles(idx(1)).name)));
%I2=imread(strcat(filepath1,num2str(allFiles(idx(2)).name)));
change=zeros(max(idx),2);
%change1=zeros(max(idx));
[w h]=size(I(:,:,1));
i=2;
l=I;
l1=I;
counter=1;
Chng=0;
cc=0;
while i<=max(idx)-3
    I=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
      m=I;
      m1=I;
      %{
      if(mod(i,10)==0)
      m=imnoise(I,'salt & pepper');
      end
      %}
      change(i)=rhistc(l,m);
     % change2=rhistc(l,m);
	 %{
     if(counter>1)
         %change(i,2)=abs(abs(change(i))-abs(change(i-intrvl)));%/(w*h);
         Chng=abs(abs(change(i))-abs(change(i-intrvl)));
        change1(i,:)= allFiles(idx(i));
     end
      %}
     
      if(change(i)/(w*h)>0.05)%change(i,2)/(w*h)>0.05)%(abs(change(i))>4000)
      %imwrite(I,strcat(filepath2,'/framess_ch/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
	  cc=[cc i];
      l=m;
      end
      %l=m;
       i=i+(intrvl*rate);
      % counter=counter+1;
      %change1=change2;
end
%cc=change;
%c=change1;
