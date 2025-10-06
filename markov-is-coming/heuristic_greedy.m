function [path] = heuristic_greedy (start_position, probabilities, Adj)
	% start_position -> the starting point in the labyrinth
	% probabilities -> vector of associated probabilities: including WIN and LOSE
	% Adj -> adjacency matrix

	% path -> the states chosen by the algorithm

	WIN = size(Adj, 1) - 1;
	path = start_position;
	visited = false(size(Adj, 1), 1);
	visited(start_position) = true;
	
	while ~isempty(path)
		current = path(end);
		if current == WIN
		return;
		end

		neighbors = [];
		for i = 1:size(Adj, 2)
			if Adj(current, i) == 1 && ~visited(i) % if the state is a neighbor and not visited
				neighbors = [neighbors, i];
			end
		end

		if isempty(neighbors)
			path(end) = [];
			continue;
		end

		[~, idx] = max(probabilities(neighbors)); % index of the maximum probability
		next = neighbors(idx);
		visited(next) = true;
		path(end + 1) = next;
	end
end