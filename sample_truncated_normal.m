function [x, nameStr, mu] = sample_truncated_normal(N)
mu = 0.5; 
sig = 0.25;
x = randn(N,1)*sig + mu;
x = min(x, 1);
x = max(x, 0);
nameStr = mfilename;


