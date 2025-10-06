function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix]; % add a column of ones to X
  htheta = X * Theta;
  s = (1 / m) * sum((htheta - Y) .^ 2);
  l1 = lambda * sum(abs(Theta)); % regularization term
  Error = s + l1;
end
