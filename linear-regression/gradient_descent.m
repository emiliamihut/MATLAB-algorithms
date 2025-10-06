function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
	
	Theta = zeros(n + 1, 1);

	for k = 1:iter
		htheta = FeatureMatrix * Theta(2:end);
		error = htheta - Y;
		gradient = (1 / m) * (FeatureMatrix' * error);
		Theta(2:end) = Theta(2:end) - alpha * gradient;
	end
end
