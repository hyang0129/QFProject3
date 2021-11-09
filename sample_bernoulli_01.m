function [X, nameStr, mu] = sample_bernoulli(N)
theta = 0.01;
mu = 0.01;
X = double(rand(N,1)<theta); 
nameStr = mfilename;