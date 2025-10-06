function [x, y] = parse_data(filename)
   
    fid = fopen(filename, 'r');
    if fid == -1
        error('error opening input file');
    end
    
    % TODO 2: Read n, x, y from the file
    n = fscanf(fid, '%d', 1);
    x = fscanf(fid, '%f', n+1);
    y = fscanf(fid, '%f', n+1);
    
    % TODO 3: Close the file
    fclose(fid);
end
