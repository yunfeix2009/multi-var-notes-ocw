#import "/lib.typ": *

#show: docs-subchapter.with(
  title: "Fundamentals of Vector Fields",
  route: "fundamentals",
)

#lbl(<def:vector-fields-fundamentals-1>, definition[
  A vector field describes how each point on the plane corresponds to a vector. For two dimensions, formally, $ vb(F) = m vu(i) + n vu(j), $ where $m$ and $n$ are dependent on $(x, y)$. 
])

Vector fields are incredibly useful in many sciences including mechanics, electricity & magnetism, thermodynamics, geography, meteorology, etc. 

In $RR^3$, a vector field takes in three values and outputs a 3D vector. $ vb(F) = p vu(i) + q vu(j) + r vu(j). $

For example, gravitational fields, gradient fields, and velocity fields are common 3D vector fields in physics. 

Through another lens, by treating the input that is $RR^n$ as a vector, a vector field could be described as a function mapping a $RR^n$ vector to a $RR^n$ vector.
