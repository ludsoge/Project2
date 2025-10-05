function l = poly_len(p, s, e)
% poly_len for curve length of a polynomial y = f(x) on [s, e]
% Inputs:
%   p - fitted polynomial coefficients (highest power first)
%   s - left bound on x
%   e - right bound on x
% Output:
%   l - curve length ∫_s^e sqrt(1 + (df/dx)^2) dx

    % df/dx for the polynomial
    dp = polyder(p);

    % ds(x) = sqrt(1 + (df/dx)^2)
    ds = @(x) sqrt( 1 + (polyval(dp, x)).^2 );

    % numerical integration
    l = integral(ds, s, e);
end
