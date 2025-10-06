function [decoded_path] = decode_path (path, lines, cols)
	% path -> vector containing the order of the states that arrived
	% 		 to a winning position
	% lines -> numeber of lines
	% cols -> number of columns

	% decoded_path -> vector of pairs (line_index, column_index)
  %                 corresponding to path states
  % hint: decoded_path does not contain indices for the WIN state

  % TODO: decode_path implementation

  WIN_idx = lines * cols + 1;

  path(path == WIN_idx) = [];  % eliminate WIN state
  l = length(path);
  decoded_path = zeros(l, 2);

  for k = 1:l
      idx = path(k);
      row = ((idx - 1) - mod(idx - 1, cols)) / cols + 1;
      col = mod(idx - 1, cols) + 1;
      decoded_path(k, :) = [row, col];
  end
end