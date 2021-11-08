function [x, nameStr, mu] = sample_normal(N,sig,mu)

N = randn(N,1)*sig + mu;
nameStr = mfilename;