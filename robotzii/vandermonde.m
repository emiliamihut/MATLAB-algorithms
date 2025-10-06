function coef = vandermonde(x, y)
   
    
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
