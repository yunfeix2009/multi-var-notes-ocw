#import "/lib.typ": *
#import "/show-rules.typ": show-rules

#show: show-rules

#set document(
  title: "Multivariable Calculus",
  author: "Saint Even, Slipper King",
)

#{
  if not _is-html {
    align(center)[
      #v(2cm)
      #title("Multivariable Calculus")
      #text(size: 13pt)[Saint Even, Slipper King]

      #text(size: 11pt)[Source: https://github.com/yunfeix2009/multi-var-notes-ocw]
    ]
    outline()
  } else {
    chapter-section("cover")[
      #html.elem("header", attrs: (class: "paper-header"))[
        #html.elem("h1", attrs: (class: "paper-title"))[
          Multivariable Calculus
        ]
        #html.elem("p", attrs: (class: "author"))[
          by #smallcaps[Saint Even, Slipper King]
        ]
        #html.elem("p", attrs: (class: "date"))[
          OpenCourseWare Notes
        ]
        #html.elem("p", attrs: (class: "paper-misc"))[
          Typst Source: https://github.com/yunfeix2009/multi-var-notes-ocw
        ]
        #html.elem("p", attrs: (class: "pdf-download"))[
          #html.elem("a", attrs: (href: "pdf/notes.pdf", class: "btn-pdf"))[
            Download PDF
          ]
        ]
        #html.elem("div", attrs: (class: "abstract"))[
          A web rendering of the multivariable calculus notes, adapted from the Typst source with HTML-specific theorem, equation, and navigation handling.
        ]
      ]
    ]
  }
}

#include "/chapters/index.typ"

