#import "../../../lib.typ":*
== Lagrange Multipliers

Constraint optimization is a core theme in many sciences and maths. When dealing with continuous changes, differentiation is one of the most important ways of dealing with them; however, our current method of critical points and the second derivative test is not enough to model _constraints_. Thus, we present lagrange multipliers. 

Formally, lagrange multipliers method is a way of finding the extrema of a smooth, multi-variate function $f(x, y, z)$ where $x$, $y$, $z$ are dependent described by the constraint equation $g(x, y, z) = c$, where $c$ is a constant. 

The key observation here is that at extremum, the level curve of $f$ is tangent to $g$. In other words, their normal vectors are parallel. Expressed in terms of gradient, $ nabla f = lambda nabla g $