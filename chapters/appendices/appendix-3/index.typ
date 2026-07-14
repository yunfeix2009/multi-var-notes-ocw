#import "/lib.typ": *
#import "/src/components/web.typ": theorem-heading
#show: docs-appendix.with(
  title: "Metric Spaces",
  route: "metric-spaces",
  description: "Metric spaces and their general theory.",
  children: [
    #include "motivation/index.typ"
    #include "properties-generalization/index.typ"
    #include "general-theory/index.typ"
  ],
)

Rather than a elaborating on multivariable, this section is meant to bridge the gap between multivariable, which is often more application heavy, and rigorous studies in analysis, such as functional analysis.
Another layer to this is how $18.S 190$, Introduction to Metric Spaces only has $6$ lectures, making it an efficient way to build a strong foundation for later studies in analysis.
