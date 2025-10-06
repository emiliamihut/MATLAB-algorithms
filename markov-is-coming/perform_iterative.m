function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	
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
