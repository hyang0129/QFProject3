function [x, nameStr, mu] = sample_beta(N)
a = 0.5;
b = 0.00005;
x = betarnd(a, b, N, 1);
mu = a/(a+b);
nameStr = mfilename;