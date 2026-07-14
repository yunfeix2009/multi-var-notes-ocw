
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Chain Rule",
  route: "chain-rule",
)
Firstly, we justify the chain rule. We know that $ Delta f approx f_x Delta x + f_y Delta y + f_z Delta z ==> (Delta f)/(Delta t) approx f_x (Delta x)/(Delta t) + f_y (Delta y)/(Delta t) + f_z (Delta x)/(Delta t). $
As $Delta t -> 0$, $(Delta f)/(Delta t) -> dv(f, t)$, $(Delta x)/(Delta t) -> dv(x, t)$, etc. At the limit of $Delta t -> 0$, we obtain $ dv(f, t) = f_x dv(x, t) + f_y dv(y, t) + dv(z, t). $

#example[
  Given $u(t)$ and $v(t)$. Show that $(u v)' = u' v + u v'$.
]
#solution[
  Let $f(u, v) := u v$. Then with chain rule we have $ dv(f, t) = dv((u v), t) = f_u dv(u, t) + f_v dv(v, t) = v dv(u, t) + u dv(v, t). $
]
#remark[
  Quotient rule could also be derived, either as a corollary of product rule with $u /v = u 1/v$, or with chain rule for multi-variable.
]

Polar coordinates poses a motivating case for which $x$ and $y$ are also multi variable functions. Then, chain rule for $f(x, y)$ where $x(u, v)$ and $y(u, v)$ is $ dif f &= f_x dif x + f_y dif y \ &= f_x (x_u dif u + x_v dif v) + f_y (y_u dif u + y_v dif v) \ &= (f_x x_u + f_y y_u) dif u + (f_x x_v + f_y y_v) dif v \ &==> cases(pdv(f, u) = f_x x_u + f_y y_u = pdv(f, x) pdv(x, u) + pdv(f, y) pdv(y, u), pdv(f, v) = f_x x_v + f_y y_v = pdv(f, x) pdv(x, v) + pdv(f, y) pdv(y, v)). $

#remark[
  It is tempting to cancel the cancel the $partial x$ and the $partial y$. However, these are partial differentials -- not total differential nor $dif$. In fact, $partial$ should remind us that partial differentials work differently compared to single differentials. $ partial != dif $
]

#example[
  Given $ cases(x:= r cos theta, y:= r sin theta), $ express $ nabla^2 = pdv(, x, 2) + pdv(, y, 2) $ in terms of $ pdv(, r), pdv(, theta), pdv(, r, 2), pdv(, theta, 2). $
]
#solution[
  We have:
  $ pdv(theta, x) = pdv(tan^(-1) (y/x), x) = (-1/x^2)/(1+(y/x)^2) = -1/(x^2 + t^2) = -1/r^2, $

  $ pdv(r, x) = pdv(sqrt(x^2 + y^2), x) = (2x)/(2 sqrt(x^2+ y^2)) = x/sqrt(x^2+y^2) = x/r. $

  So,
  $
    pdv(, x) & = pdv(, theta) pdv(theta, x) + pdv(, r) pdv(r, x) \
             & = -y/r^2 pdv(, theta) + x/r pdv(, r).
  $

  Similarly, $ pdv(theta, y) = pdv(tan^(-1) (y, x), y) = x/r^2, $
  $ pdv(r, y) = y/r. $

  Thus, $ pdv(, y) & = pdv(theta, y) pdv(, theta) + pdv(r, y) pdv(, r) \
           & = x/r^2 pdv(, theta) + y/r pdv(, r). $

  $
    nabla^2 &= pdv(, x) pdv(, x) + pdv(, y) pdv(, y) \ &= (-y/r^2 pdv(, theta) + x/r pdv(, r))^2 + (x/r^2 pdv(, theta) + y/r pdv(, r))^2
    \ &= (-(sin theta)/r pdv(, theta) + cos theta pdv(, r))^2 + ((cos theta)/r pdv(, theta) + sin theta pdv(, r))^2
    \ &= - (sin theta)/r pdv(, theta) (-(sin theta)/r pdv(, theta) + cos theta pdv(, r))
    \ & quad"" + cos theta pdv(, r) (-(sin theta)/r pdv(, theta) + cos theta pdv(, r))
    \ & quad quad "" + (cos theta)/r pdv(, theta) ((cos theta)/r pdv(, theta) + sin theta pdv(, r))
    \ & quad quad quad"" + sin theta pdv(, r) ((cos theta)/r pdv(, theta) + sin theta pdv(, r))
    \ &= - (sin theta)/r (- (cos theta)/r pdv(, theta) - (sin theta)/r pdv(, theta, 2) - sin theta pdv(, r) + cos theta pdv(, r, theta))
    \ & quad"" + cos theta ((sin theta)/r^2 pdv(, theta) - (sin theta)/r pdv(, r, theta) + cos theta pdv(, r, 2))
    \ & quad quad"" + (cos theta)/r (- (sin theta)/r pdv(, theta) + (cos theta)/r pdv(, theta, 2) + cos theta pdv(, r) + sin theta pdv(, r, theta))
    \ & quad quad quad"" + sin theta (-(cos theta)/r^2 pdv(, theta) + (cos theta)/r pdv(, r, theta) + sin theta pdv(, r, 2)).
  $

  Combining like terms gives,
  $
    & = ((sin^2 theta)/r^2 + (cos^2 theta)/r^2 ) pdv(, theta, 2) + (cos^2 theta + sin^2 theta) pdv(, r, 2)
    \ & quad""+ (- (sin theta cos theta)/r - - (sin theta cos theta)/r + (sin theta cos theta)/r + (sin theta cos theta)/r) pdv(, theta, r)
    \ & quad quad"" + ((sin^2 theta)/r + (cos^2 theta)/r) pdv(, r)
    \ & quad quad quad""+ ((sin theta cos theta)/r^2 + (sin theta cos theta)/r^2 - (sin theta cos theta)/r^2 - (sin theta cos theta)/r^2) pdv(, theta)
    \ & = 1/r^2 pdv(, theta, 2) + pdv(, r, 2), + 1/r pdv(, r)
    .
  $
]
#remark[
  Notice in here, we abused the notation as if $pdv(a, b, 2) = pdv(, b) pdv(, b) a =(pdv(, b))^2 a$. However, if this abuse is taken further, treating $pdv(a, b, 2)$ as $pdv(a, b) dot pdv(a, b)$, it is not necessarily true, especially with the constants. If $pdv(a, b, 2)$ is _directly_ treated as multiplication, then the third equality will follow as: $ & =y^2/r^4 pdv(, theta, 2) + x^2/r^2 pdv(, r, 2) - (2x y)/r^3 pdv(theta, r) \
  & quad"" + x^2/r^4 pdv(, theta, 2) + y^2/r^2 pdv(, r, 2) + (2 x y)/r^3 pdv(, theta, r) \
  & = 1/r^2 pdv(, theta, 2) + pdv(, r, 2), $
  which misses the $1/r pdv(, r)$ term.
]
