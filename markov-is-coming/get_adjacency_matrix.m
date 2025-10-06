function [Adj] = get_adjacency_matrix(Labyrinth)

  % Labyrinth -> the matrix of all encodings
  
  % Adj -> the adjacency matrix associated to the given labyrinth
  
  % TODO: get_adjacency_matrix implementation
  
  [m, n] = size(Labyrinth);
  N = m * n;
  WIN = N + 1;
  LOSE = N + 2;
  Adj = zeros(N + 2, N + 2);

  for i = 1:m
      for j = 1:n
          idx = (i - 1) * n + j;
          code = Labyrinth(i, j);

          north = mod(code, 16) >= 8; % bit 3 = 1
          south = mod(code, 8)  >= 4; % bit 2 = 1
          east  = mod(code, 4)  >= 2; % bit 1 = 1
          west  = mod(code, 2)  == 1; % bit 0 = 1

          if (~north && i > 1)
              neighbor = (i - 2) * n + j;
              Adj(idx, neighbor) = 1;
              Adj(neighbor, idx) = 1;
          end
          if (~south && i < m)
              neighbor = i * n + j;
              Adj(idx, neighbor) = 1;
              Adj(neighbor, idx) = 1;
          end
          if (~east && j < n)
              neighbor = (i - 1) * n + j + 1;
              Adj(idx, neighbor) = 1;
              Adj(neighbor, idx) = 1;
          end
          if (~west && j > 1)
              neighbor = (i - 1) * n + j - 1;
              Adj(idx, neighbor) = 1;
              Adj(neighbor, idx) = 1;
          end
          % win/lose
          if (i == 1 && ~north) || (i == m && ~south)
            Adj(idx, WIN) = 1;
            Adj(WIN, idx) = 1;
          end
          if (j == 1 && ~west) || (j == n && ~east)
            Adj(idx, LOSE) = 1;
            Adj(LOSE, idx) = 1;
          end
      end
  end
  % set win/lose to 1 from 0
  Adj(WIN, :) = 0;
  Adj(LOSE, :) = 0;
  Adj(WIN, WIN) = 1;
  Adj(LOSE, LOSE) = 1;

  Adj = sparse(Adj);
end
