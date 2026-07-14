
#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Differentials",
  route: "differentials",
)
Motivated by the one dimensional case, if $y = f(x)$, then $dif y = f'(x) dif x$. From this, an infinitesimal change in one variable is related to another. One obvious benefits of this is that the reverse direction becomes easy to obtain.

#lbl(<ex:differentiation-differentials-1>, example[
  If $y= sin^(-1) x$, find $(dif y)/(dif x)$.])

#solution[
  Applying $sin$ on both sides, $x = sin y$, so $ dif x = cos y dif y ==> (dif y)/(dif x) = 1/(cos y) = 1/sqrt(1-x^2). $
]

=== Total Differentials
#lbl(<def:differentiation-differentials-1>, definition[
  For a function $f(x, y, z), x, y, z in RR$, the total differential of $f$ is $ dif f & = f_x dif x + f_y dif y + f_z dif z & = pdv(f, x) dif x + pdv(f, y) dif y + pdv(f, z) dif z. $
])

However, it is not entirely obvious what are differentials -- they are not numbers, matrices, vectors, and they have special rules of manipulations.

+ First, $dif f != Delta f$. $Delta f$ is meant to be a number while $dif f$ encodes how does change in $x$, $y$, and $z$ affect $f$.
+ Also, $dif f$ serves as a placeholder for small variables $Delta x$, $Delta y$, and $Delta z$ to get $Delta f approx f_x Delta x + f_y Delta y + f_z Delta z$.
+ Dividing $dif t$ on both sides to find the rate of change wrt $t$. $ dv(f, t) = f_x dv(x, t) + f_y dv(y, t) + dv(z, t). $

In summary, $dif != Delta$

From rule $3$, we invented the chain rule for multi-variables.
