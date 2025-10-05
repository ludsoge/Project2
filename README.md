# Mandelbrot Boundary Approximation (MATLAB)
---

## Overview

The full process involves three main steps:

1. **Boundary Extraction** — Detect the fractal edge using the bisection method on an indicator function.  
2. **Polynomial Fitting** — Fit a 15th-order polynomial to the valid boundary points using `polyfit`.  
3. **Length Estimation** — Compute the curve length of the polynomial using `integral`.

---

## File Descriptions

| File | Description |
|------|--------------|
| `fractal.m` | Determines if a complex point \( c \) belongs to the Mandelbrot set using \( z_{n+1} = z_n^2 + c \). |
| `fractal_implemention.m` | Simple script that tests `fractal.m` and prints iteration count for a given \( c \). |
| `indicator_fn_at_x.m` | Returns a function \( f(y) \) = -1 if inside, +1 if outside the Mandelbrot set. |
| `bisection.m` | Generic bisection root-finding routine for locating sign changes in \( f(y) \). |
| `bisection_implemention.m` | Iterates over \( x \in [-2, 1] \) and applies `bisection` to find boundary points. |
| `fit_boundary_poly_implemention.m` | Fits a 15th-order polynomial to valid boundary points and plots results. |
| `poly_len.m` | Calculates curve length \( L = \int_s^e \sqrt{1 + (f'(x))^2} \, dx \) for a polynomial \( y=f(x) \). |
| `poly_len_implemention.m` | Applies `poly_len` to the fitted polynomial to estimate the boundary length. |
---

## How to Run
Put all the files under the same directory, then run the scripts in order in MATLAB:

% (Optional) Test single point
fractal_implemention

% 1. Generate boundary points
bisection_implemention

% 2. Fit a 15th-order polynomial
fit_boundary_poly_implemention

% 3. Compute the polynomial curve length
poly_len_implemention
