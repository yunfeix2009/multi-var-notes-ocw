#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Motivation and Definition],
  route: "motivation",
  description: "motivation and definition of metric spaces in analysis",
)
Euclidean space, $RR^n$ and the distance between two points (or norm of a vector) is $ norm(vb(P)) = sqrt(sum_(i=1)^n P_i^2). $

This metric, or loosely, way of determining the distance, has several important properties.
+ Symmetric
  $ norm(vb(x) - vb(y)) = norm(vb(y) - vb(x)). $
+ Positive Definite
  $ norm(vb(x) - vb(y)) >= 0 and (norm(vb(x) - vb(y)) = 0 <==> vb(x) = vb(y)). $
+ Triangle Inequality
  $ norm(vb(x) - vb(z)) <= norm(vb(x) - vb(y)) + norm(vb(y) - vb(z)). $

Generalizing, #definition[
  A metric space is a set $X$ with a function $d: X times X -> [0, oo)$ that satisfies the three properties listed above.
]

$integral.double (1 4 3 4 )$

With this, many objects and techniques in real analysis could be generalized.

#example[
  Define $d:RR^n times RR^n -> [0, oo)$ that maps $(x, y) |-> max_(1<=i <=n) abs(x_i - y_i)$, show that $(RR^n, d)$ forms a metric space.
]
#solution[
  Symmetric and positive definite are easy to show. To show that $d$ satisfies the triangle inequality, since $n$ is finite, we consider the $j$ that must exists and satisfies $ d(x, z) & := max_(1<=i<=n) abs(x_i - z_i) \
          & = abs(x_j - z_j) \
          & <= abs(x_j - y_j) + abs(y_j - z_j) \
          & <= max_(1<=i<=n) abs(x_i - y_i) + max_(1<=i<=n) abs(y_i - z_i) \
          & = d(x, y) + d(y, z). #qedhere $
]

#example[
  Define $d:RR^n times RR^n -> [0, oo)$ that maps $(x, y) |-> sum_(i=1)^n abs(x_i - y_i)$, show that $(RR^n, d)$ forms a metric space.
]
#solution[
  Symmetry and positive definite are easy to show. To show that $d$ satisfies the triangle inequality, we could split up the summation then use triangle inequality on each absolute values individually.
]
#remark[
  Generalizing to $ d_p (x, y) = (sum_(i=1)^n abs(x_i - y_i)^p)^(1/p), $ we get the $ell^p$ metric that is "deeply important in functional analysis," at least according to Prof. Paige. To show that it satisfies the triangle inequality, Holder's Inequality  $ sum_(i=1)^n abs(a_i b_i)
  <= (sum_(i=1)^n abs(a_i)^p)^(1/p)
  (sum_(i=1)^n abs(b_i)^q)^(1/q),
  quad 1/p + 1/q = 1, $
  and Minkowski's Inequality comes in handy $ (sum_i abs(u_i + v_i)^p)^(1/p)
  <= (sum_i abs(u_i)^p)^(1/p)
  + (sum_i abs(v_i)^p)^(1/p). $
]
