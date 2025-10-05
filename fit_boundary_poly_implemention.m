% select valid boundary points
valid = ~isnan(ys);
x = xs(valid);
y = ys(valid);

% keep the points along the actual fractal
% tune the range from xmin to xmax by looking at the scatter
xmin = -2.0;
xmax =  0.5;
keep = (x >= xmin) & (x <= xmax);
x = x(keep);
y = y(keep);

% sort by x (nice plot and stable fit)
[x, orderIdx] = sort(x(:));
y = y(orderIdx);

order = 15;
p = polyfit(x, y, order);

% --- overlay the fitted curve on Mandelbrot background (post-only) ---
xGrid = linspace(-2, 1, 600);
yGrid = linspace(-1.5, 1.5, 600);
[X, Y] = meshgrid(xGrid, yGrid);

% fractal() for every point
frac = arrayfun(@(xr, yi) fractal(xr + 1i*yi), X, Y);

x_plot = linspace(min(x), max(x), 2000);
y_plot = polyval(p, x_plot);

figure;
imshow(frac, [0, 100], 'XData', [min(xGrid) max(xGrid)], ...
    'YData', [min(yGrid) max(yGrid)]);
set(gca,'YDir','normal'); colormap(hot); axis on; axis equal;
title('Mandelbrot with boundary polynomial fit');
xlabel('Re(c)'); ylabel('Im(c)'); hold on;

% boundary points + fitted curve
plot(x, y, 'c.', 'MarkerSize', 4, 'DisplayName','boundary points');
plot(x_plot, y_plot, 'w-', 'LineWidth', 1.5, 'DisplayName','order-15 polynomial');

% plot
figure;
plot(x, y, '.', 'DisplayName','boundary points'); hold on;
plot(x_plot, y_plot, '-', 'LineWidth', 1.5, 'DisplayName','order-15 polynomial');
axis equal
xlabel('x'); ylabel('y');
title(sprintf('Polynomial fit (order %d)', order));
legend('Location','best');


% RMSE
y_hat = polyval(p, x);
rmse = sqrt(mean((y_hat - y).^2));
rmse_vec = abs(y_hat(:) - y(:));
figure;
plot(x, rmse_vec, '.-');
xlabel('x'); ylabel('abs error');
title('RMSE');

