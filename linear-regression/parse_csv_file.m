function [Y, InitialMatrix] = parse_csv_file(file_path)
	% path -> a relative path to the .csv file

	% Y -> the vector with all actual values
	% InitialMatrix -> the matrix that must be transformed

	% TODO: parse_csv_file implementation
	fid = fopen(file_path, 'r');
	fgetl(fid);

	Y = [];
	InitialMatrix = {};
	row = 1;

	while ~feof(fid) % read the file 
		line = fgetl(fid);
		tokens = strsplit(line, ','); % split the line into tokens
		Y(row, 1) = str2double(tokens{1});
		for j = 2:length(tokens)
			val = str2double(tokens{j});
			if isnan(val) % check if the value is not a number
				InitialMatrix{row, j - 1} = tokens{j};
			else
				InitialMatrix{row, j - 1} = val;
			end
		end
		row = row + 1; 
	end

	fclose(fid);
end