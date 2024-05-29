function [sift]= slide_sift3(path,intrvl,rate)
filepath1=strcat( 'dataset/',path,'/frames/');
filepath2=strcat( 'dataset/',path);
allFiles = dir(filepath1);

allNames = { allFiles.name };
[~,idx]=sort([allFiles.datenum]);
allFiles(idx(1));

I=imread(strcat(filepath1,num2str(allFiles(idx(1)).name)));
%I1=imread(strcat(filepath1,num2str(allFiles(idx(2)).name)));
change=zeros(max(idx),2);
test=zeros(max(idx),9);
%change1=zeros(max(idx));
[w h]=size(I(:,:,1));

i=2;
l=I;
kk=1;
counter=1;
Chng=0;
sift=0;
while i<=max(idx)-3
    
    I1=imread(strcat(filepath1,num2str(allFiles(idx(i)).name)));
    I2=imread(strcat(filepath1,num2str(allFiles(idx(i+1*rate)).name)));
      m=I1;
      m1=I;
      m2=I2;
      l1=I1;
      l2=I2;
      I = single(rgb2gray(l)); % Conversion to single is recommended
      J = single(rgb2gray(l1)); % in the documentation
      K = single(rgb2gray(l2)); 

    [F1 D1] = vl_sift(I);
    [F2 D2] = vl_sift(J);
    [F3 D3] = vl_sift(K);

    % Where 1.5 = ratio between euclidean distance of NN2/NN1
    [matches1 score] = vl_ubcmatch(D1,D2,1.5); 
    [matches2 score] = vl_ubcmatch(D2,D3,1.5);   
    [matches3 score] = vl_ubcmatch(D1,D3,1.5);   
    M1=size(matches1,2);
    M2=size(matches2,2);
    M3=size(matches3,2);
    pp=1;
	%{
    test(kk,1)=M1;
    test(kk,2)=M2; 
    test(kk,3)=M3;
    test(kk,4)=i-1;
    test(kk,5)=i;
    test(kk,6)=i+1;
	%}
    avg=(M1+M2+M2)/3;
    mad=(1/3)*(abs(M1-avg)+abs(M2-avg)+abs(M3-avg));
    T=avg*(1-(1/mad));
    if(M1>T & M2<T & M3<T)
       % imwrite(I2,strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i+1*rate)).name)));
		sift=[sift i+1];
         l=l2;
         pp=0;
         i=i+1;
       % copyfile(strcat(filepath1,'/framess_sift/frames/',num2str(allFiles(idx(i)).name)),strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name))));
    else if(M1<T & M2>T & M3<T)
       % imwrite(l1,strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
		sift=[sift i];
         l=l2;
         i=i+1;
        % pp=0;
        
	else if((M1<T & M2<T & M3<T) || (M1<T & M2<T & M3>T))
       % imwrite(l1,strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
		%imwrite(I2,strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i+1*rate)).name)));
		sift=[sift i];
		sift=[sift i+1];
         l=l2;
         i=i+1;
        % pp=0;
        end
        end
    end
    
    
    test(kk,7)=T;
    test(kk,8)=mad;
    test(kk,9)=avg;
    
   % l=l2;
    %l1=l2;
    if pp~=0
    l=l1;
    end
    %{
      if(mod(i,10)==0)
      m=imnoise(I,'salt & pepper');
      end
      
      change(i)=rhistc(l,m);
     % change2=rhistc(l,m);
     if(counter>1)
         %change(i,2)=abs(abs(change(i))-abs(change(i-intrvl)));%/(w*h);
         Chng=abs(abs(change(i))-abs(change(i-intrvl)));
        change1(i,:)= allFiles(idx(i));
     end
     
    num2str(allFiles(idx(i)).name)
    T=max(size(F1,2),size(F2,2))*0.25;
    test(i,1)=size(matches,2);
    test(i,2)=T;
    if(size(matches,2)<=T)
    % size(matches,2)
    % max(size(F1,2),size(F2,2))*0.2
     % if(change(i)/(w*h)>0.05)%change(i,2)/(w*h)>0.05)%(abs(change(i))>4000)
      imwrite(I1,strcat(filepath2,'/framess_sift/frames',num2str(intrvl),'_1/',num2str(allFiles(idx(i)).name)));
     % l=m;
      end
      l=m;
    %}
       i=i+(intrvl*rate);%i=i+((intrvl*2)*rate);
       counter=counter+1;
       kk=kk+1;
      %change1=change2;
end
%cc=change;
%c=change1;
%c=test;
