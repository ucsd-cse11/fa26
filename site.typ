#import "course.typ": term, doodle, quick-links, staff, sessions, intro

#import "lib/site.typ": shell, rail, calendar

// Only the landing page is published for now. syllabus.typ and
// assignments/pa1.typ still exist in the repo but are deliberately not built:
// an unlinked page is still a page, reachable by anyone who guesses the URL.
// Restoring one is a #document call plus its import.
#document("index.html",
  title: [#term.course #term.name],
  description: [#term.course, #term.name: #term.title])[
  #shell(
    rail(term, doodle, quick-links, staff, intro: intro),
    html.elem("main", attrs: (class: "cal-col"), calendar(term, sessions)),
  )
]

#asset("assets/site.css", read("assets/site.css", encoding: none))
#asset("typst.txt", read("typst.txt", encoding: none))
