% select valid boundary points
valid = ~isnan(ys);
x = xs(valid);
y = ys(valid);

% keep the points along the actual fractal
% tune the range from xmin to xmax by looking at the scatter
xmin = -2.0;
xmax =  0.3;
keep = (x >= xmin) & (x <= xmax);
x = x(keep);
y = y(keep);

% sort by x (nice plot and stable fit)
[x, orderIdx] = sort(x(:));
y = y(orderIdx);

order = 15;
p = polyfit(x, y, order);

% evaluate on new x values
x_plot = linspace(min(x), max(x), 2000);
y_plot = polyval(p, x_plot);

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

