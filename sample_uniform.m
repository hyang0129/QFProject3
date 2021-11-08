function [X, nameStr, mu] = sample_uniform(N)
a = 0;
b = 1;

X = a + (b-a)*rand(N,1);
mu = 0.5 ;
nameStr = mfilename;