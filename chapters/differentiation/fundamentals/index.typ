
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Fundamentals of Partial Derivatives",
  route: "fundamentals",
)

To visualize a function of two inputs, one may use a 3D graph with z-axis being $f(x, y)$.

When the curve is difficult to be drawn as 3D, contour plot is also a great way for visualization. It allows quick determination the function values, extremum and the growth of the function wrt directions .

Temperature and geographical topological graphs are real life examples of contour plot.

To quantify the change of the growth of the function in $x$ and $y$ directions, we make the following definitions inspired by the one-dimensional differentiation:

$ (partial f)/(partial x) (x_0, y_0) = lim_(Delta x -> 0 ) (f(x_0 + Delta x, y_0) - f(x_0, y_0))/(Delta x), $ and $ (partial f)/(partial y) (x_0, y_0) = lim_(Delta y -> 0 ) (f(x_0, y_0 + Delta y) - f(x_0, y_0 + Delta y))/(Delta y). $

In other words, we take the derivative of $f$ wrt $x$ or $y$ while treating the other variable as a constant.

