function y_interp = P_spline(coef, x, x_interp)
   

    x = x(:);          % make sure x is a column vector
    xi = x_interp(:);  % make sure x_interp is a column vector

    n = length(x) - 1;
    y_interp = zeros(size(xi));

    idx = zeros(size(xi));
    for k = 1:length(xi)
        pos = find(x <= xi(k), 1, 'last');
        if isempty(pos)
            pos = 1;    % clamp below domain
        elseif pos == length(x)
            pos = n;    % clamp above domain
        end
        idx(k) = pos;
    end

    seg = idx - 1;           % zero-based segment index
    dx = xi - x(idx);        % relative position in segment
    base = 4*seg + 1;        % base index for coef vector

    a = coef(base);
    b = coef(base + 1);
    c = coef(base + 2);
    d = coef(base + 3);

    y_interp = a + b.*dx + c.*dx.^2 + d.*dx.^3;
end
