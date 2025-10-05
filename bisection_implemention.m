% produce boundary points xs, ys
xs = linspace(-2, 1, 1000);      % at least 10^3 points as required
ys = nan(size(xs));

for i = 1:numel(xs)
    x  = xs(i);
    fn = indicator_fn_at_x(x);   % +1 outside, -1 inside

    s = 0.0;     % lower bound inside (y=0)
    e = 1.5;     % upper bound above the fractal

    % only run bisection when the precondition holds
    if fn(s) < 0 && fn(e) > 0
        ys(i) = bisection(fn, s, e);
    else
        ys(i) = NaN;  % skip points that do not bracket the boundary
    end
end

% --- background ---
xGrid = linspace(-2, 1, 600);
yGrid = linspace(-1.5, 1.5, 600);
[X, Y] = meshgrid(xGrid, yGrid);

% fractal() for every point
frac = arrayfun(@(xr, yi) fractal(xr + 1i*yi), X, Y);

figure;
imshow(frac, [0, 100], 'XData', [min(xGrid) max(xGrid)], ...
       'YData', [min(yGrid) max(yGrid)]);
set(gca,'YDir','normal'); colormap(hot); axis on; axis equal;
title('Mandelbrot with boundary'); xlabel('Re(c)'); ylabel('Im(c)');
hold on;
plot(xs, ys, 'c.', 'MarkerSize', 5);

