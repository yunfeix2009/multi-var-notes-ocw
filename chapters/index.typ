#import "/lib.typ": *
#set heading(numbering: none)
#route-prefix.update(())
#route-folders.update(())
#thm-counter.thm-counters.update((:))
#thm-state.thm-stored.update(())

#include "cover.typ"
#include "preface/index.typ"
#set heading(numbering: "1.1")
#counter(heading).update(0)
#include "preliminaries/index.typ"
#include "differentiation/index.typ"
#include "integration/index.typ"
#include "vector-fields/index.typ"

#set heading(numbering: "A.1")
#counter(heading).update(0)
#route-prefix.update(("appendices",))
#include "appendices/index.typ"
#include "bibliography/index.typ"
