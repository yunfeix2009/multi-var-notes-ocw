#import "../../../lib.typ":*
== Curl 

Curl is one of the most important vector field operators that has significant consequences in Physics, such as fluid dynamics. 

#definition[
  For a vector field $vb(F) = (M, N)$, curl of $F$ is defined as $ op("curl")(F) = N_x - M_y. $
]

Notice that the curl is $0$ iff $vb(F)$ is conservative. 

For a velocity field, _curl_ measures the rotation component of motion at given point. One could verify this through testing the constant vector field, radial vector field, and show that they have $0$ curl. In fact, curl measure twice the angular velocity at a given point. 

For a force field, _curl_ measure the torque exerted on a point per unit inertia at that given point. 