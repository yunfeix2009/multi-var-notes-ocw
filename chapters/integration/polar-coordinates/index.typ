#import "../../../lib.typ"
== Double Integrals in Polar Coordinates 

The solution to @emp:3.1.2 is more complicated than necessary. In fact, it could be greatly simplified with the use of polar coordinates that maximally exploit the symmetry of both the function and the region. 

Recall that in polar coordinates, we have $ cases(x = r cos theta, y = r sin theta) and cases(r = sqrt(x^2 + y^2), theta = tan^(-1) y/x). $

Thus, if $ z &=1-x^2 - y^2 = 1-r^2, \ R: &={(x, y): 0<=x, y<=1} \ &= {(r, theta): r in [0, 1] and theta in [0, pi/2], $ 
$ integral.double_R z dif x dif y &= integral_0^(pi/2) integral_0^1 (1-r^2) r dif r dif theta
\ &= integral_0^(pi/2) lr((r^2/2 - r^4/4) |)_0^1 dif theta
\ &= integral_0^(pi/2) 1/2 dif theta
\ &= pi/8
. $

In particular, $ dif A = r dif r dif theta. $
