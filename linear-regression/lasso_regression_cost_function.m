function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: lasso_regression_cost_function implementation
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix]; % add a column of ones to X
  htheta = X * Theta;
  s = (1 / m) * sum((htheta - Y) .^ 2);
  l1 = lambda * sum(abs(Theta)); % regularization term
  Error = s + l1;
end