function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'
    
    % TODO: Calculate the Vandermonde coefficients
    
    n = length(x) - 1;            % Degree of the polynomial
    V = zeros(n + 1);             % Initialize Vandermonde matrix
    
    % Construct Vandermonde matrix: V(i,j) = x(i)^(j-1)
    for i = 1:n + 1
        for j = 1:n + 1
            V(i, j) = x(i)^(j - 1);
        end
    end
    
    % Solve the linear system V * coef = y
    coef = V \ y;
end
