#import "/lib.typ": *

#show: docs-chapter.with(
  title: "Integration",
  route: "int",
  description: "integration of multiple variables",

  children: [
    #include "double-integrals/index.typ"
    #include "polar-coordinates/index.typ"
    #include "double-int-application/index.typ"
    #include "change-of-variables/index.typ"
    #include "line-integrals/index.typ"
    #include "triple-integrals/index.typ"
    #include "spherical-coordinates/index.typ"
  ],
)

Here, we examine the concepts of integration for functions with more than one variables along with their applications.
