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


#document("calendar.html",
  title: [Course Calendar],
  description: [#term.course, #term.name: Course Calendar])[
  #shell(
    rail(term, doodle, quick-links, staff),
    html.elem("main", attrs: (class: "cal-col"))[
      #html.elem("h1", [Course Calendar])
      #html.elem("p", [This page contains the schedule of lectures, help hours, and discussions.])
      #html.elem("div", attrs: (class: "gcal-embed"))[
        #html.elem("iframe", attrs: (
          src: "https://calendar.google.com/calendar/embed?src=c_eeb415d89b4f07b48852ef4a94e9995b79bfdd44e7a2b3013905c5d1a489dcd1%40group.calendar.google.com&ctz=America%2FLos_Angeles",
          style: "border: 0",
          width: "100%",
          height: "600",
          frameborder: "0",
          scrolling: "no",
        ), [])
      ]
    ]
  )
]

#asset("assets/site.css", read("assets/site.css", encoding: none))
#asset("typst.txt", read("typst.txt", encoding: none))
