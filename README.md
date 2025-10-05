## Mandelbrot Boundary Approximation (MATLAB)

The full process involves three main steps:

1. Boundary Extraction — Detect the fractal edge using the bisection method on an indicator function.  
2. Polynomial Fitting — Fit a 15th-order polynomial to the valid boundary points.  
3. Length Estimation — Compute the curve length of the polynomial.

### How to Run
Files without "implemention" are functions.
Put all the files under the same directory, then run the scripts in order in MATLAB:

Test single point
fractal_implemention

1. Generate boundary points
bisection_implemention

2. Fit a 15th-order polynomial
fit_boundary_poly_implemention

3. Compute the polynomial curve length
poly_len_implemention
