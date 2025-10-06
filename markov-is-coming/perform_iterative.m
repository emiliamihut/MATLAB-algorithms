function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations

	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

   % TODO: perform_iterative implementation
	prev = x0;
	for steps = 1:max_steps

		x = G * prev + c;
		err = norm(x - prev);
		if err < tol
			return;
		end
		prev = x;
	end
end