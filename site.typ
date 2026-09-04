#import "course.typ": term, intro, doodle, quick-links, policies, staff, sessions
#import "lib/site.typ": shell, rail, calendar

#document("index.html",
  title: [#term.course #term.name],
  description: [#term.course, #term.name: #term.title])[
  #shell(
    rail(term, intro, doodle, quick-links, policies, staff),
    html.elem("main", attrs: (class: "cal-col"), calendar(term, sessions)),
  )
]

#asset("assets/site.css", read("assets/site.css", encoding: none))
