function [x, nameStr] = sample_truncated_normal(N,sig,mu)
mu = 0.5; 
x = randn(N,1)*sig + mu;
x = min(x, 1);
x = max(x, 0);
nameStr = mfilename;


