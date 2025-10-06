function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  % TODO: linear_regression_cost_function implementation
  m = size(Y, 1);
  X = [ones(m, 1), FeatureMatrix];
  htheta = X * Theta;
  Error = (1 / (2 * m)) * sum((htheta - Y) .^ 2);
end
