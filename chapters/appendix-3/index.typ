#import "../../lib.typ": *
= Metric Spaces

The nominal motivation for this section is to define objects that appear frequently in analysis, such as $DD, S_1$ and that the Complex Analysis notes have limited topological recap. However, another layer to this is how $18.S 190$ only has $6$ lectures, making it an efficient way to build a strong foundation for later studies in analysis, which is what this Multivariable notes partially for.

== Motivation
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

$ integral.double (1 4 3 4 )$

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

Now, we consider how objects in real analysis could be generalized by metric spaces.
+ Convergent Sequences
  #definition[
    A sequence ${x_i} in X$ converges in metric space $(X, d)$ iff $ forall epsilon in RR^+, exists N in NN: forall n > N, d(x_n - x_N)< epsilon. $
  ]
  #remark[
    In here, we generalized the absolute value in the classic real analysis definition to $d$.
  ]
+ Cauchy Sequences
  #definition[
    A sequence ${x_i} in X$ is a Cauchy sequence in metric space $(X, d)$ iff $ forall epsilon in RR^+, exists N in NN: forall n, m > N, d(x_n - x_m)< epsilon. $
  ]
  #remark[
    In here, we similarly generalized the absolute value in the classic real analysis definition to $d$.
  ]
+ Open Set
  First, we define what we mean by an open ball.
  #definition[
    $B_r (a)$ is an open ball in $(X, d)$ iff
    $ B_r (a) := {x in X: d(x, a)< r}. $
  ]
  Then, the definition for open set in $(X, d)$ just replaces the old open ball definition with the new one.
  #definition[
    A set $A$ is open iff $ forall a in A, exists epsilon in RR^+ : B_epsilon (a) subset.eq A. $
  ]
+ Continuous Functions
  #definition[
    Let $f:X |-> Y$, each with metric $(X, d_x)$ and $(Y, d_y)$. $f$ is continuous iff $
      forall epsilon in RR^+, forall x_1, x_2 in X, exists delta in RR^+: d_x (x_1, x_2) < delta ==> d_y (f(x_1), f(x_2))< epsilon.
    $
  ]
  #remark[
    In here, we similarly generalized the absolute value in the classic real analysis definition to $d$.
  ]

#definition[
  $C^0 ([a, b]):=  $ the set of all continuous functions that maps $[a, b] |-> RR$.
]
#example[
  For $f, g in C^0 ([a, b])$, let $ d_C_0 ([f, g]) = sup_(x in [a, b]) abs(f(x) - g(x)). $ Then, $([a, b], d_C_0)$ is a metric. 
]<emp:metric-onC>
#solution[
  Still, we only need to show the triangle inequality, where we have to use the Extreme Value Theorem. Fix $f, g, h in C^0 ([a, b])$, we know that the supremum exists as they are continuous on a closed interval, then we could apply $abs(a - b) <= abs(a -c) + abs(b -c)$. 
]

#definition[
  $C^n ([a, b]):=  $ the set of all n-th continuously differentiable functions that maps $[a, b] |-> RR$.
]
#example[
  Fix $f, g in C^1 ([a, b])$, then $ d_C_1 = sup_(x in [a, b]) abs(f(x)- g(x)) +sup_(x in [a, b]) abs(f'(x)- g'(x)) $ is a metric. 
]#solution[
  The proof is similar to @emp:metric-onC. 
]

With these generalizations, some bold claims may be made. 
#theorem[
  Consider the function: $dv(, t)$ that maps $C^1 ([a, b]) -> C^0 ([a, b])$, $dv(, t)$ is continuous as a map between metric spaces $ (C^1 ([a, b]), d_C_1)$ and $(C^0 ([a, b])), d_C_0)$. 
]
#proof[

]