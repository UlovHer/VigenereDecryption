function [maxgcd]=maxgcd(A)
% clc;
% clear all;
% A=[108 126 264 318 330];
n=length(A);
maxgcd=A(1);
for i=1:(n-1)
    maxgcd=gcd(maxgcd,A(i+1));
end
end