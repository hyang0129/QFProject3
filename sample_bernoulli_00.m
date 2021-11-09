function [X, nameStr, mu] = sample_bernoulli(N)
theta = 0.0;
mu = 0.0;
X = double(rand(N,1)<theta); 
nameStr = mfilename;