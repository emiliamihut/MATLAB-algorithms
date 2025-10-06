function [Y, InitialMatrix] = parse_data_set_file(file_path)

    fid = fopen(file_path, 'r');

    dims = fscanf(fid, '%d', 2); % read the first two numbers

    m = dims(1); % number of rows in the matrix
    n = dims(2); % number of columns in the matrix
    fgetl(fid); % skip the next line

    Y = zeros(m, 1);
    InitialMatrix = cell(m, n);

    for i = 1:m
        line = fgetl(fid); % read a line from the file
        data = strsplit(strtrim(line)); % split the line into individual values
        
        Y(i) = str2double(data{1});

        for j = 2:n+1
            val = data{j};
            num = str2double(val);

            if isnan(num) % check if the value is not a number
                InitialMatrix{i, j-1} = val;
            else
                InitialMatrix{i, j-1} = num;
            end
        end
    end

    fclose(fid);
end
