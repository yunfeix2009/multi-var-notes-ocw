#import "/lib.typ": *

#show: docs-subchapter.with(
  title: [General Theory of Metric Spaces],
  route: "general-theory",
  description: "properties of metric spaces. ",
)

Here, we consider what can be said about the most fundamental objects in the space we are studying, namely the metric space, and what theorems are there in the tool box to study them.

#theorem[
  Given sequence ${x_i}$ defined on the metric space $(X, d)$, if it converges, then its convergence point is unique.
]
#proof[
  Let $x_n -> x$. Suppose there is $y in X$ and $x_n -> y$, it suffices to show $x= y$. Thus, by definition, $ forall epsilon in RR^+, quad exists N_1, N_2 in NN: \ (forall n > N_1, quad d(x_n, x)< epsilon) and (forall n> N_2, quad d(x_n, y)< epsilon). $

  Thus, $ forall epsilon in RR^+, quad exists N = max{N_1, N_2} $
  so that, with the three defining properties of a metric, $ 0<= d(x, y) <= d(x, x_n) + d(x_n, y) < 2 epsilon. $ Therefore, $d(x, y) = 0$, $x = y$.
]

Not only do the limit points act nicely, the distance to the limit points also act nicely.

#theorem[
  Given sequence ${x_i} -> x$, then $forall y in X, quad d(x_i, y)-> d(x, y)$.
]
#proof[
  By triangle inequality, $d(x_n, y) = d(x_n, y) + d(x_n, x))< epsilon + d(x, y)$, forall $epsilon in RR^+$.

  For the lower bound, by triangle inequality, $d(x_n, y) >= d(x, y) - d(x, x_n)>=d(x, y) - epsilon$. Thus, $ forall epsilon in RR^+, quad d(x, y) - epsilon < d(x_n, y) < d(x, y) + epsilon. $ So, $ d(x_i, y) -> d(x, y). $
]

#theorem[
  Convergent sequences are Cauchy.
]
#proof[
  For a sequence $x_n -> x$, $forall epsilon in RR^+, quad exists N in NN: forall n>NN, d(x_n, n)< epsilon$.
]
