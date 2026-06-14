#import "../../../lib.typ":*
== Conservative Fields

For a function $f(x, y)$, consider the vector field of $vb(F) = nabla f$. #definition[The potential function of this field is $f$. ]

If $c$ is a curve connecting $P_0$ and $P_1$, with direction from $P_0$ to $P_1$, 

#theorem[
  Fundamental Theorem of Calculus states that $ integral_c nabla f dot vb(r) = f(P_1) - f(P_0). $
] <thm:line-integral-gradient>
#proof[
  We parametrize the curve in terms of $t$, then we have $ cases(x=x(t), y=y(t)) ==> cases(dif x = x'(t) dif t, dif y = y'(t) dif t). $
  $ integral_c nabla f dot vb(r) &= integral_c f_x dif x + f_y dif y
  \ &=integral_c pdv(f, x) dv(x, t) + pdv(f, y) dv(y, t) dif t 
  \ &= integral_c dv(f, t) dif t 
  \ &= f(P_1) - f(P_1). $
]
#remark[
  The result of integration does _not_ depend on the trajectory of $c$, but only the direction and the start and end points. 
]

#definition[
  Fix a vector field $vb(F) $. If $forall c$ s.t. $c$ is closed, $ integral_c vb(F) dot dif vb(r) = 0, $ then we define $vb(F)$ as a _conservative_ field. 
]

With @thm:line-integral-gradient, we have any gradient field is a conservative field. In fact, by conservation of energy, all force fields will have to be a conservative field. 

Physically, if $U(x, y)$ describes the potential energy, then the force field $ vb(F) = - gradient U(x, y). $ 

#theorem[
  Vector field $vb(F)$ is conservative iff it is path-independent, meaning $integral_c vb(F) dot vb(r)$ only depends on the direction and the starting and ending point of $c$. 
]
#proof[
  If $vb(F)$ is conservative, every closed loop $c$ gives $integral_c vb(F) dot vb(r) = 0$. Thus, for any line integral, we add it to a line pointing from the end point to its starting point. Since $vb(F)$ is conservative, the sum must be $0$, so the two values are inverses. So, for any trajectory, they yield the same value as the line directly going back, meaning they must have the same value. Thus, path-independent. 

  If $vb(F)$ is path-independent, then any closed loop must yield the same value as no movement, so the integration must yield $0$. Thus, conservative. 
]

#theorem[
  Vector field $vb(F)$ is conservative iff it is a gradient field. 
]<thm:conservativeToGradient>
#proof[
  Gradient to conservative direction is implied by the @thm:line-integral-gradient. 

  The other direction is more involved. Recall that $(f_x)_y = (f_y)_x$. If $vb(F) = M vu(i) + N vu(j)$ and if $vb(F)$ is a gradient field, $M_y = N_x$. The important observation is that the inverse is true. 

  #lemma[
    If $vb(F) = (M, N)$ and $M_y = N_x$, then $exists f: vb(F) = nabla f$. 
  ]
  #proof[
    uhhhhh imma learn green's and come back to it
  ]
]
#definition[
  A differential form is _exact_ if it could be written as $dif f$ for some function $f$. 
]
#theorem[
  Vector field $f$ is conservative iff $M dif x + N dif y$ is an exact differential. 
]
#proof[
  This comes directly from the fact that gradient field and conservative field are the same thing. 
]