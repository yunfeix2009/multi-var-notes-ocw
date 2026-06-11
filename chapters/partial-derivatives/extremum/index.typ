#import "../../../lib.typ":*
== Extremum

One of the most consequential applications of partial derivatives is in optimization problems involving multiple variables, ie. finding the max/min of a multi-variable function. 

#theorem[
  At the local extremum of a differentiable two-variable function $f(x, y)$, $f_x = f_y = 0$. In other words, the tangent plane to $f$ at its local extremum is horizontal. 
]

Now, the question is how to determine whether a critical point ($f_x = f_y = 0$) is a maximum or minimum, or neither. In fact, it is possible to have a critical point as a saddle point, that is neither a maximum or minimum. 

=== Application -- Least-Squares Interpolation
Motivation: Given experimental data $(x_i, y_i)$, what is the "best-fit" line that describes the relationship between $x$ and $y$. 

More rigorously, for $n$ data points of $(x_i, y_i)$, define the error of a data point to the "best-fit" line, $y= a x + b$ to be $(y(x_i) - y_i)^2$. The best-fit line is the line that minimizes the sum of the errors of the data points. In other words, we aim to minimize $ D = sum_(i=1)^n (y_i - (a x_i + b))^2, $ by manipulating $a$ and $b$ given $x_i$ and $y_i$. 

Naturally, we look for the critical points of $D$ wrt $a$ and $b$. Differentiating gives $ cases(pdv(D, a) = sum_(i=1)^n 2(y_i - (a x_i + b)) (-x_i) = 0, pdv(D, b) = sum_(i=1)^n 2(y_i - (a x_i + b)) (-1) =0) $ 
So, $ cases(sum_(i=1)^n x_i y_i = sum_(i=1)^n x_i (a(x_i) + b) = (sum_(i=1)^n x_i^2) a + (sum_(i=1)^n x_i) b, sum_(i=1)^n y_i = sum_(i=1)^n (a x_i + b) = (sum_(i=1)^n x_i)a + n b ). $
Now, we have a linear system of $a$ and $b$. It remains simple to solve for $a$ and $b$ explicitly. 

Moreover, with the second-derivative test, it could be shown that the critical point of $a$ and $b$ obtained above indeed minimizes $D$ rather than maximizes it or is a saddle point. 

This method could be used on non-linear fitting as well. For example, for an exponential fitting in the form of $y = a e^(b x)$, where $x$ and $y$ are variables and $a$ and $b$ are constants, a linear form could be obtained by applying $ln$ on both sides: $ln(y) = ln(a) + b x$. From here, we could apply the method of least-squares and solve for $a$ and $b$. 

Additionally, this method could be generalized to any finite number of parameters. With the regression function $f(x, y, z, dots)$ and $ D(x, y, z, dots) = sum_(i=1)^n (y_i - f(x, y, z, dots)), $ a system of linear equations could be obtained by setting $pdv(D, x) = 0$, $pdv(D, y) = 0$, etc. Then, it remains to show that the critical value for $(x, y, z, dots)$ obtained does minimize $D$. 