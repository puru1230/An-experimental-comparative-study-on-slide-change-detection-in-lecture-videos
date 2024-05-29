function cc= slide_bpd(path,intrvl,rate)
% Black pixel distribution
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);

allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
allFiles(idx(1));

I=imread(strcat(filepath1,num2str(allFiles(idx(1)).name)));
%{
I2=imread(strcat(filepath1,num2str(allFiles(idx(2)).name)));
change=zeros(max(idx));
change1=zeros(max(idx));
%}
i=2;
l=I;
l1=I;
counter=1;
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
      a=im2bw(l,0.5);
      b=im2bw(m,0.5);
      px=abs(bx_val(a)-bx_val(b));
      a1=im2bw(l1,0.5);
      b1=im2bw(m1,0.5);
      px1=abs(bx_val(a1)-bx_val(b1));
      %change(i)=rhistc(l,m);
     %{
     change2=rhistc(l,m);
     if(counter>5000)
         change(i,2)=abs(change(i))-abs(change(i-intrvl));
     end
      l=m;
     %}
      py=abs(by_val(a)-by_val(b));
      py1=abs(by_val(a1)-by_val(b1));
      %cc(i,1)=sum(px);
      %cc(i,2)=sum(py);
      if(sum(px)>1000||sum(py)>1000)
      %imwrite(I,strcat(filepath2,'/framess_bd/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
      cc=[cc i];
      l=m;
      
      else
      if(sum(px1)>1000||sum(py1)>1000)
     % imwrite(I,strcat(filepath2,'/framess_bd/fcc/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
      cc=[cc i];
      end
      end
       i=i+(intrvl*rate);
       l1=m1;
      % counter=counter+1;
      %change1=change2;
end

