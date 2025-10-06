function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
 
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix];
  htheta = X * Theta;
  Error = (1 / (2 * m)) * sum((htheta - Y) .^ 2);
end
