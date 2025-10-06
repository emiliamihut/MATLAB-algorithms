function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  % TODO: ridge_regression_cost_function implementation
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix]; % add a column of ones for the bias term
  htheta = X * Theta;
  s = (1 / (2 * m)) * sum((htheta - Y) .^ 2);
  l2 = lambda * sum(Theta .^ 2);
  Error = s + l2;
end
