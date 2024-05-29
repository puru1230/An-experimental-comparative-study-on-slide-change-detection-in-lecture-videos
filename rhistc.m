function [ S ] = rhistc( I,J)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
S=0;
for i=1:3
R=0;
for b=0:15 %7
a=~(I(:,:,i)<=(16*(b+1))&I(:,:,i)>=b);%(32*(b+1))&I(:,:,i)>=b);
c=~(J(:,:,i)<=(16*(b+1))&J(:,:,i)>=b);%(32*(b+1))&J(:,:,i)>=b);
%x=a-c;
R=R+abs(sum(a(:))-sum(c(:)));
end
S=S+R;
end
end

