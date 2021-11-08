function [X, nameStr, mu] = sample_bernoulli(N)
theta = 0.5;
mu = 0.5;
X = double(rand(N,1)<theta); 
nameStr = mfilename;