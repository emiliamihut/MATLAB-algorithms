function [Labyrinth] = parse_labyrinth(file_path)
	% file_path -> the relative path to a file that needs to
  %              be loaded_graphics_toolkits

  % Labyrinth -> the matrix of all encodings for the labyrinth's walls

  % TODO: parse_labyrinth implementation
  fid = fopen(file_path, 'r');

  dims = fscanf(fid, '%d', 2);
  m = dims(1);
  n = dims(2);

  data = fscanf(fid, '%d', [n, m])'; % read the matrix, transpose it because the file is in column-major order
  fclose(fid);
  Labyrinth = data;
end
