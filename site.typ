#import "course.typ": term, doodle, quick-links, staff, sessions
#import "syllabus.typ": syllabus

#import "lib/site.typ": shell, rail, calendar

#document("index.html",
  title: [#term.course #term.name],
  description: [#term.course, #term.name: #term.title])[
  #shell(
    rail(term, doodle, quick-links, staff),
    html.elem("main", attrs: (class: "cal-col"), calendar(term, sessions)),
  )
]
#document("syllabus.html",
  title: [Syllabus],
  description: [#term.course, #term.name: #term.title])[
  #shell(
    rail(term, doodle, quick-links, staff),
    html.elem("main", syllabus)
  )
]

#asset("assets/site.css", read("assets/site.css", encoding: none))
#asset("typst.txt", read("typst.txt", encoding: none))
