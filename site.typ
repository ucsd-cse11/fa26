#import "course.typ": term, doodle, quick-links, staff, sessions, intro
#import "assignments/pa0.typ": pa0
#import "assignments/pa1.typ": pa1
#import "syllabus.typ": syllabus

#import "lib/site.typ": shell, rail, calendar

#document("index.html",
  title: [#term.course #term.name],
  description: [#term.course, #term.name: #term.title])[
  #shell(
    rail(term, doodle, quick-links, staff, intro: intro),
    html.elem("main", attrs: (class: "cal-col"), calendar(term, sessions)),
  )
]

#document("syllabus.html",
  title: [Syllabus],
  description: [#term.course, #term.name: Syllabus])[
  #shell(
    rail(term, doodle, quick-links, staff),
    html.elem("main", syllabus)
  )
]

// A page one directory down. `base` is how far back up to the site root, and
// both shell and rail need it: shell carries the stylesheet link, rail carries
// every href course.typ supplies as a plain string.
#document("assignments/pa0.html",
  title: [PA 0],
  description: [#term.course, #term.name: PA 0])[
  #shell(
    rail(term, doodle, quick-links, staff, base: "../"),
    html.elem("main", pa0),
    base: "../",
  )
]


#asset("assets/site.css", read("assets/site.css", encoding: none))
#asset("typst.txt", read("typst.txt", encoding: none))
