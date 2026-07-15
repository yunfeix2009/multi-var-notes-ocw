#import "/src/components/index.typ": render-mode, route-folders, thm-counter, thm-state
#set heading(numbering: none)
#route-folders.update(())
#thm-counter.thm-counters.update((:))
#thm-state.thm-stored.update(())

#include "cover.typ"
#include "preface/index.typ"


#context if render-mode.get() == "pdf" {
  pagebreak()
}

#set heading(numbering: "1.1")
#counter(heading).update(0)
#include "preliminaries/index.typ"
#context if render-mode.get() == "pdf" {
  pagebreak()
}
#include "differentiation/index.typ"
#context if render-mode.get() == "pdf" {
  pagebreak()
}
#include "integration/index.typ"
#context if render-mode.get() == "pdf" {
  pagebreak()
}
#include "vector-fields/index.typ"
#context if render-mode.get() == "pdf" {
  pagebreak()
}

#set heading(numbering: "A.1")
#counter(heading).update(0)
#route-folders.update(("appendices",))
#include "appendices/index.typ"

#context if render-mode.get() == "pdf" {
  pagebreak()
}
#include "bibliography/index.typ"

