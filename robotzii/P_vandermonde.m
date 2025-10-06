function y_interp = P_vandermonde(coef, x_interp)
    % P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
    % coef = [a0, a1, a2, ..., an]'
    % y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

    % TODO: Calcualte y_interp using the Vandermonde coefficients

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
