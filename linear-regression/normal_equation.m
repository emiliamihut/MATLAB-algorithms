function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)

	A = FeatureMatrix' * FeatureMatrix;
	b = FeatureMatrix' * Y;
	n = size(FeatureMatrix, 2);

	% Matrix is positive definite - source MathWorks
	try
        chol(FeatureMatrix);
    catch ME
        return;
    end

	x = zeros(n, 1);
	r = b;
	v = r;
	% Conjugate gradient method
	for k = 1:iter
		alpha = (r' * r) / (v' * (A * v));
		x = x + alpha * v;
		r2 = r - alpha * A * v;
		if r2' * r2 < tol^2
			break;
		end
		beta = (r2' * r2) / (r' * r);
		v = r2 + beta * v;
		r = r2;
	end

	Theta = [0; x];
end
