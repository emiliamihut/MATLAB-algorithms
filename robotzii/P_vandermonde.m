function y_interp = P_vandermonde(coef, x_interp)

    n = length(coef) - 1;       % degree of polynomial
    x_interp = x_interp(:);     % ensure column vector
    y_interp = zeros(length(x_interp), 1);
    
    % Horner's method for polynomial evaluation
    for i = 1:length(x_interp)
        y = coef(end);
        for k = n-1:-1:0
            y = y * x_interp(i) + coef(k + 1);
        end
        y_interp(i) = y;
    end
end
