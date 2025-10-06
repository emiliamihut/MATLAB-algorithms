function [Link] = get_link_matrix (Labyrinth)
	
  Adj = get_adjacency_matrix(Labyrinth);

    [rows, cols] = size(Adj);
    Link = zeros(rows, cols);

    for i = 1:rows
        for j = 1:cols
            if Adj(i, j) == 1
                nr = sum(Adj(i, :) == 1); % count the number of neighbors
                if nr > 0
                    Link(i, j) = 1 / nr;
                end
            end
        end
    end
  
    Link = sparse(Link);
end
