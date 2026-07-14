
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Extremum",
  route: "extremum",
)
One of the most consequential applications of partial derivatives is in optimization problems involving multiple variables, ie. finding the max/min of a multi-variable function.

#theorem[
  At the local extremum of a differentiable two-variable function $f(x, y)$, $f_x = f_y = 0$. In other words, the tangent plane to $f$ at its local extremum is horizontal.
]

Note: The global extremum may lie on the boundary or at infinity.

Now, the question is how to determine whether a critical point ($f_x = f_y = 0$) is a maximum or minimum, or neither. In fact, it is possible to have a critical point as a saddle point, that is neither a maximum or minimum.

Thus, a natural question that comes is how to determine what type of extremum a critical point is. For that, we look into the second-derivative test.

=== Second Derivative Test
Define the second derivatives for a twice-differentiable two-variable function $f(x, y)$, $pdv(f, x, 2) = pdv(pdv(f, x), x) = f_(x x)$. We also have $f_(x y) = pdv(f, x, y) = pdv(f, y, x) = f(y, x)$.

Define the following quantities for the second-derivative test assuming $(x_0, y_0)$ is a critical point, $ cases(A = f_(x x) (x_0, y_0), B = f_(x y) (x_0, y_0), C = f_(y y) (x_0, y_0)). $

Then, we have $ f "has a" cases("local minimum" & "if" A C - B^2 > 0 and A>0, "local maximum" & "if" A C - B^2 > 0 and A < 0, "saddle point" &"if" A C - B^2< 0, "inconclusive" &"if" A C - B^2 = 0). $

#proof[
  We invoke the two dimensional Taylor's approximation (which could be obtained by considering the one variable case then use chain rule): $ Delta f & approx f_x (x- x_0) + f_y (y-y_0) \
          & quad""+ 1/2 f_(x x) (x- x_0)^2 + f_(x y ) (x-x_0) (y-y_0)+ 1/2 f_(y y) (y-y_0)^2 . $

  Since we are at a critical point, $f_x = f_y = 0$. Thus, the determining terms are the second order ones. Therefore,
  $ Delta f & approx 1/2 f_(x x) (x- x_0)^2 + f_(x y ) (x-x_0) (y-y_0)+ 1/2 f_(y y) (y-y_0)^2 . $

  Let the perturbation in $x$ be $h$ and the perturbation in $y$ be $k$. Then, $ Delta f approx 1/2 f_(x x) h^2 + f_(x y) h k + 1/2 f_(y y) k^2 := Q(h, k). $

  Observe that $ Q(h, k) = 1/2 mat(h; k) mat(f_(x x), f_(x y); f_(x y), f_(y y)) mat(h, k). $
  So, we have the determinant criterion $f_(x x) f_(y y) - f_(x y)^2$. So, if $f_(x x) f_(y y) - f_(x y)^2 > 0$, Q is definite (sign does *not* depend on $h$ and $k$) -- positive when $f_(x x)> 0$ and vice versa. While $Q$ is indefinite (sign *does* depends on $h$ and $k$) when $f_(x x) f_(y y) - f_(x y)^2< 0$.

  Therefore, for the inconclusive case of $f_(x x) f_(y y) - f_(x y)^2 = 0$, the situation of the critical point depends on higher derivatives.
]
#remark[
  Here, we make a connection to the subject of linear algebra. More generally, with more than $2$ variables, define Hessian matrix $vb(H)$ such that $ vb(H)_(i j) = f_(x_i x_j). $ Fix critical point $vb(x)_0$, $vb(x)_0$ is a minimum iff $vb(H)$ is positive definite and maximum iff $vb(H)$ is "negative definite," meaning all eigenvalues negative. This is due to $ forall vb(x), vb(x)^top vb(A) vb(x) > 0 <==> vb(A) "is positive definite". $ The proof of this theorem could be seen in _Notes of Linear Algebra_ by _Saint Even et al._ subsection $8.2.2$ (may change due to versions), Positive Definite Matrices under Eigenvalues and Eigenvectors chapter.

  Particularly, the rather cumbersome conditions above translates neatly to signs of the eigenvalues of the Hessian matrix.
]
#example[
  Consider the function $f(x, y) = x+y + 1/(x y), x in R^+ and y in R^+$, find its extremum(s).
]
#solution[
  We proceed to find its critical points: $ cases(pdv(f, x) = 1 - 1/y 1/x^2 = 0, pdv(f, y) = 1 - 1/x 1/y^2 = 0) ==> cases(x^2 = y, y^2 = x) ==> (x, y) = (1, 1). $
  To determine the status of this critical point, we use the second derivative test. $ cases(A = f_(x x) = 2/ y 1/x^3, B = f(x y) = 1/x^2 1/y^2, C = f(y y) = 2/x 1/y^3). $ The criterion $ A C - B^2 = 4/(x^4 y^4) >> 0 and f_(x x) >>0. $
  Thus, $f(x, y)$ has a local minimum at $(1, 1)$ while attains its maximum, $oo$, when $x -> oo or y -> oo or (x-> oo and y -> oo)$.
]

=== Application -- Least-Squares Interpolation
Motivation: Given experimental data $(x_i, y_i)$, what is the "best-fit" line that describes the relationship between $x$ and $y$.

More rigorously, for $n$ data points of $(x_i, y_i)$, define the error of a data point to the "best-fit" line, $y= a x + b$ to be $(y(x_i) - y_i)^2$. The best-fit line is the line that minimizes the sum of the errors of the data points. In other words, we aim to minimize $ D = sum_(i=1)^n (y_i - (a x_i + b))^2, $ by manipulating $a$ and $b$ given $x_i$ and $y_i$.

Naturally, we look for the critical points of $D$ wrt $a$ and $b$. Differentiating gives $ cases(pdv(D, a) = sum_(i=1)^n 2(y_i - (a x_i + b)) (-x_i) = 0, pdv(D, b) = sum_(i=1)^n 2(y_i - (a x_i + b)) (-1) =0) $
So, $ cases(sum_(i=1)^n x_i y_i = sum_(i=1)^n x_i (a(x_i) + b) = (sum_(i=1)^n x_i^2) a + (sum_(i=1)^n x_i) b, sum_(i=1)^n y_i = sum_(i=1)^n (a x_i + b) = (sum_(i=1)^n x_i)a + n b). $
Now, we have a linear system of $a$ and $b$. It remains simple to solve for $a$ and $b$ explicitly.

Moreover, with the second-derivative test, it could be shown that the critical point of $a$ and $b$ obtained above indeed minimizes $D$ rather than maximizes it or is a saddle point.

This method could be used on non-linear fitting as well. For example, for an exponential fitting in the form of $y = a e^(b x)$, where $x$ and $y$ are variables and $a$ and $b$ are constants, a linear form could be obtained by applying $ln$ on both sides: $ln(y) = ln(a) + b x$. From here, we could apply the method of least-squares and solve for $a$ and $b$.

Additionally, this method could be generalized to any finite number of parameters. With the regression function $f(x, y, z, dots)$ and $ D(x, y, z, dots) = sum_(i=1)^n (y_i - f(x, y, z, dots)), $ a system of linear equations could be obtained by setting $pdv(D, x) = 0$, $pdv(D, y) = 0$, etc. Then, it remains to show that the critical value for $(x, y, z, dots)$ obtained does minimize $D$.



