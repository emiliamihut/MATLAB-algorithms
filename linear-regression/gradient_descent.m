function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
	% FeatureMatrix -> the matrix with all training examples
	% Y -> the vector with all actual values
	% n -> the number of predictors
	% m -> the number of trainings
	% alpha -> the learning rate
	% iter -> the number of iterations

	% Theta -> the vector of weights

	% TODO: gradient_descent implementation
	Theta = zeros(n + 1, 1);

	for k = 1:iter
		htheta = FeatureMatrix * Theta(2:end);
		error = htheta - Y;
		gradient = (1 / m) * (FeatureMatrix' * error);
		Theta(2:end) = Theta(2:end) - alpha * gradient;
	end
end