function [X, nameStr, mu] = sample_bernoulli(N)
theta = 1.0;
mu = 1.0;
X = double(rand(N,1)<theta); 
nameStr = mfilename;