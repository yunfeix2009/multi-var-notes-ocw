
#import "/lib.typ": *
#show: docs-appendix.with(
  title: "Vector Algebra and Kepler Laws",
  route: "vector-kepler",
  description: "reviewing vector algebra with application in proving kepler laws mathematically",
  children: [
    #include "vector-algebra/index.typ"
    #include "kepler-laws/index.typ"
  ],
)
