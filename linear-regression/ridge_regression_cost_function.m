function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix]; % add a column of ones for the bias term
  htheta = X * Theta;
  s = (1 / (2 * m)) * sum((htheta - Y) .^ 2);
  l2 = lambda * sum(Theta .^ 2);
  Error = s + l2;
end
