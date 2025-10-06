function coef = spline_c2(x, y)
    % Remember that the indexes in Matlab start from 1, not 0
    %
    % si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
    % si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
    % si''(x) =                   2ci          + 6di(x - xi)
    %
    % TODO 1: si(xi) = yi, i = 0 : n - 1
    % TODO 2: s_n-1(xn) = yn
    % TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
    % TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
    % TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
    % TODO 6: s0''(x0) = 0
    % TODO 7: s_n-1''(x_n) = 0
    %
    % Solve the system of equations

    n = length(x) - 1;  % number of intervals
    h = diff(x);        % interval lengths

    % Coefficient a_i = y_i for i=1..n
    a = y(1:n);

    % Initialize vectors to build sparse matrix A
    rows = [];
    cols = [];
    vals = [];

    % TODO 6 & 7: natural spline boundary conditions (second derivatives zero at endpoints)
    rows(end+1) = 1;
    cols(end+1) = 1;
    vals(end+1) = 1;

    rows(end+1) = n + 1;
    cols(end+1) = n + 1;
    vals(end+1) = 1;

    % TODO 3,4,5: continuity of s_i, s_i', s_i'' at internal knots
    for i = 2:n
        rows(end+1) = i;
        cols(end+1) = i - 1;
        vals(end+1) = h(i - 1);

        rows(end+1) = i;
        cols(end+1) = i;
        vals(end+1) = 2 * (h(i - 1) + h(i));

        rows(end+1) = i;
        cols(end+1) = i + 1;
        vals(end+1) = h(i);
    end

    % Create sparse matrix A
    A = sparse(rows, cols, vals, n + 1, n + 1);

    % Initialize right-hand side vector for c coefficients
    b_vec = zeros(n + 1, 1);

    for i = 2:n
        b_vec(i) = 3 * ((y(i + 1) - y(i)) / h(i) - (y(i) - y(i - 1)) / h(i - 1));
    end

    % Solve linear system for c (second derivative coefficients)
    c = A \ b_vec;

    % Compute b and d coefficients for each interval (TODO 1 & 2 indirectly)
    b = zeros(n, 1);
    d = zeros(n, 1);

    for i = 1:n
        b(i) = (y(i + 1) - y(i)) / h(i) - h(i) * (2 * c(i) + c(i + 1)) / 3;
        d(i) = (c(i + 1) - c(i)) / (3 * h(i));
    end

    % Stack coefficients in order [a0; b0; c0; d0; a1; b1; c1; d1; ...]
    coef = zeros(4 * n, 1);

    for i = 1:n
        idx = (i - 1) * 4;
        coef(idx + 1) = a(i);
        coef(idx + 2) = b(i);
        coef(idx + 3) = c(i);
        coef(idx + 4) = d(i);
    end
end
