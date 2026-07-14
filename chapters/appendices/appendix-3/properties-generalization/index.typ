#import "/lib.typ": *
#show: docs-subchapter.with(
  title: [Generalization of Important Properties ],
  route: "generalization",
  description: [generalizing concepts from $RR^n$ to metric spaces],
)

Now, we consider how several objects in real analysis could be generalized by metric spaces.
+ Convergent Sequences
  #definition[
    A sequence ${x_i} in X$ converges in metric space $(X, d)$ iff $ forall epsilon in RR^+, quad exists N in NN: forall n > N, quad d(x_n - x_N)< epsilon. $
  ]
  #remark[
    In here, we generalized the absolute value in the classic real analysis definition to $d$.
  ]
+ Cauchy Sequences
  #definition[
    A sequence ${x_i} in X$ is a Cauchy sequence in metric space $(X, d)$ iff $ forall epsilon in RR^+, quad exists N in NN: forall n,quad m > N,quad d(x_n - x_m)< epsilon. $
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
    A set $A$ is open iff $ forall a in A,quad exists epsilon in RR^+ : B_epsilon (a) subset.eq A. $
  ]
+ Continuous Functions
  #definition[
    Let $f:X |-> Y$, each with metric $(X, d_x)$ and $(Y, d_y)$. $f$ is continuous iff $ forall epsilon in RR^+, quad forall x_1, x_2 in X, quad exists delta in RR^+: d_x (x_1, x_2) < delta ==> d_y (f(x_1), f(x_2))< epsilon. $
  ]
  #remark[
    In here, we similarly generalized the absolute value in the classic real analysis definition to $d$.
  ]

#definition[
  $C^0 ([a, b]):=$ the set of all continuous functions that maps $[a, b] |-> RR$.
]
#example[
  For $f, g in C^0 ([a, b])$, let $ d_C_0 ([f, g]) = sup_(x in [a, b]) abs(f(x) - g(x)). $ Then, $([a, b], d_C_0)$ is a metric.
]<emp:metric-onC>
#solution[
  Still, we only need to show the triangle inequality, where we have to use the Extreme Value Theorem. Fix $f, g, h in C^0 ([a, b])$, we know that the supremum exists as they are continuous on a closed interval, then we could apply $abs(a - b) <= abs(a -c) + abs(b -c)$.
]

#definition[
  $C^n ([a, b]):=$ the set of all n-th continuously differentiable functions that maps $[a, b] |-> RR$.
]
#example[
  Fix $f, g in C^1 ([a, b])$, then $ d_C_1 = sup_(x in [a, b]) abs(f(x)- g(x)) +sup_(x in [a, b]) abs(f'(x)- g'(x)) $ is a metric.
]#solution[
  The proof is similar to @emp:metric-onC.
]

With these generalizations, some bold claims may be made.
#theorem[
  Consider the function: $dv(, t)$ that maps $C^1 ([a, b]) -> C^0 ([a, b])$, $dv(, t)$ is continuous as a map between metric spaces $(C^1 ([a, b]), d_C_1)$ and $(C^0 ([a, b])), d_C_0)$.
]
#proof[
  Here, we directly invoke the definition of continuity of operators. It suffices to show that $ forall epsilon in RR^+, quad forall f, g in C^1 ([a, b]), quad exists delta in RR^+: d_C_1 (f, g) < delta ==> d_C_0 (f', g')< epsilon. $
  By definition, $ d_C_1 (f, g) = sup_(x in [a, b]) abs(f - g) + sup_(x in [a, b]) abs(f' - g') < delta, $ and $ d_C_0(f'g') = sup_(x in [a, b]) abs(f - g). $
  Let $delta := epsilon$, then $ sup_(x in [a, b]) abs(f - g) <= sup_(x in [a, b]) abs(f - g) + sup_(x in [a, b]) abs(f' - g') < delta . $
  Thus,   $d_C_0(f'g') = sup_(x in [a, b]) abs(f - g) < epsilon. #qedhere$
]

Moreover, one could show that the integration from $a$ to $b$ is also a continuous operator.

#example[
  Show that if $L_1 : C^0 ([a, b]) times C^0 ([a, b]) -> [0, oo),$ and $ L_1 = integral_0^1 abs(f(x) - g(x)) dif x, $ then $(C^0 ([a, b]), L_1)$ is a metric.
]
#solution[
  Symmetry and positive are easy to show and that if $f = g$ then $L_1(f, g) = 0$; however, showing $L_1(f, g) = 0 ==> f = g$ is non-trivial, as say if $f$ and $g$ are different be a point, then their integrals are still the same.

  Assume for contradiction that $f!= g$, then $ exists x_0 in [a, b]: f(x_0) != g(x_0). $ WLOG, $f(x_0) > g(x_0)$, then $ exists r in RR: forall x_1 in B_r (x_0), quad f(x_1) > g(x_1). $ Then, $ integral_a^b abs(f(x) - g(x)) dif x > 0, $ contradiction.

  Triangle inequality holds as the integrand satisfies the triangle inequality. Hence, $L_1$ is a metric.
]
#remark[
  Note that this metric is similar to the previously defined $l_1$ metric, which sums over finitely many terms.

  Moreover, this motivates the generalization of $ d_L_p = (integral_a^b abs(f(x) - g(x))^p dif x)^(1/p). $#image("/assets/image-3.png")
]

Another important fact to keep in mind is that metric space is a generalization of a vector space, which states that addition is contained within the space, which is not necessarily true for metric space.
#example[
  The unit circle does not form a vector space as the addition of two vectors on the circle will not be on the circle; however, it forms a metric space if distance is defined as the geodesic.
]
