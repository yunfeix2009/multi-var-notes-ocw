#import "/lib.typ": *
#set heading(numbering: "1.1")
#chapter-section("preliminaries")[
  #include "preliminaries/index.typ"
]

#if not _is-html {
  oldpagebreak()
}
#chapter-section("differentiation")[
  #include "differentiation/index.typ"
]

#if not _is-html {
  oldpagebreak()
}

#chapter-section("integration")[
  #include "integration/index.typ"
]
#if not _is-html {
  oldpagebreak()
}
// appendix

#set heading(numbering: "A.1")
#counter(heading).update(0)
#chapter-section("appendix-1")[
  #include "/chapters/appendix-1/index.typ"
]
#chapter-section("appendix-2")[
  #include "/chapters/appendix-2/index.typ"
]
