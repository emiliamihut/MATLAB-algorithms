function [G, c] = get_Jacobi_parameters (Link)
	% Link -> the link matrix (edge with probabilities matrix)

	% G -> iteration matrix
	% c -> iteration vector

	% TODO: get_Jacobi_parameters

	N = size(Link, 1) - 2;  % just transitory states
	WIN = N + 1;
	LOSE = N + 2;

	G = Link(1:N, 1:N);
	M = Link(1:N, [WIN, LOSE]);
	b = [1; 0];
	c = M * b;
end