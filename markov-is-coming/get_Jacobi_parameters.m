function [G, c] = get_Jacobi_parameters (Link)
	
	N = size(Link, 1) - 2;  % just transitory states
	WIN = N + 1;
	LOSE = N + 2;

	G = Link(1:N, 1:N);
	M = Link(1:N, [WIN, LOSE]);
	b = [1; 0];
	c = M * b;
end
