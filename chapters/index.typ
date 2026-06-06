#import "/lib.typ" : *
#set heading(numbering: "1.1")
#chapter-section("preliminaries")[
  #include "preliminaries/index.typ"
]
#chapter-section("vector-differential-operators")[
  #include "vector differential operators/index.typ"
]


// appendix
#set heading(numbering: "A.1")
#counter(heading).update(0)
#chapter-section("appendix-1")[
  #include "appendix-1/index.typ"
]
#chapter-section("appendix-2")[
  #include "appendix-2/index.typ"
]
