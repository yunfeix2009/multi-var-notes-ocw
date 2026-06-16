#import "../../../lib.typ":*
== Partial Differential Equations

Partial Differential Equations are equations involving partial derivatives of an unknown function. 

#example[
  The heat equation that describes the change of heat in a closed environment without internal heat generators or drains is $ pdv(f, t) = k (pdv(f, x, 2) + pdv(f, y, 2) + pdv(f, z, 2)). $
]<eq:heat>

However, despite being on the syllabus of $18.02$, according to Denis, this is all one needs to know about it, besides the fact that they are quite challenging, even $18.03$ that only covers the one variable case is still quite non-trivial. 