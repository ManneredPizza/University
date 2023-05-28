close all;
clear all;

I = imread("cameraman.tif");
Id = double(I);
s = size(Id);

A = zeros(s);
B = zeros(s);

%il problema qua è trovare una divisione generica che vada sempre bene
A(2:2:end,1:2:end) = Id(2:2:end,1:2:end) / 256;
B(1:2:end,2:2:end) = Id(1:2:end,2:2:end) / 256;

d = sum(A(:)) / nnz(A) - sum(B(:)) / nnz(B)

%il problema qua è che è sempre notabile questa filigrana
key = 0.0002;
A = A + key;
B = B - key;

dNew = sum(A(:)) / nnz(A) - sum(B(:)) / nnz(B)

Inew = uint8(cat(2, (A+B)*256));