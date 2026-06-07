#import "/lib.typ": *

== Dot Product

#definition[
For vectors $bold(a) = chevron a_1, a_2, dots, a_n chevron.r$
and
$bold(b) = chevron b_1, b_2, dots, b_n chevron.r,$
their *dot product* is defined by
$bold(a) dot bold(b)
:= sum_(i=1)^n a_i b_i.$
The dot product is a scalar.
]

#theorem[
$norm(bold(a))^2
=
bold(a) dot bold(a)
=
sum_(i=1)^n a_i^2.
$
]

#theorem[
$bold(a) dot bold(b)
=
norm(bold(a)) norm(bold(b)) cos theta.
$
]

#proof[
We first consider the two-dimensional case.
By the Law of Cosines, if $bold(c) = bold(a) - bold(b),$ then

$
norm(bold(c))^2
=
norm(bold(a))^2
+
norm(bold(b))^2
-
2 norm(bold(a)) norm(bold(b)) cos theta.
$

On the other hand,

$
norm(bold(c))^2
=
bold(c) dot bold(c)
=
(bold(a) - bold(b)) dot (bold(a) - bold(b))
$

$
=
norm(bold(a))^2
+
norm(bold(b))^2
-
2 (bold(a) dot bold(b)).
$

Comparing the two expressions yields

$
bold(a) dot bold(b)
=
norm(bold(a)) norm(bold(b)) cos theta. #qedhere
$
]

#corollary[
$
bold(a)$ is orthogonal to $
bold(b)$
if and only if $bold(a) dot bold(b) = 0.
$
]