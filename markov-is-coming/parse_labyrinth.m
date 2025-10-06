function [Labyrinth] = parse_labyrinth(file_path)
	
  fid = fopen(file_path, 'r');

  dims = fscanf(fid, '%d', 2);
  m = dims(1);
  n = dims(2);

  data = fscanf(fid, '%d', [n, m])'; % read the matrix, transpose it because the file is in column-major order
  fclose(fid);
  Labyrinth = data;
end
