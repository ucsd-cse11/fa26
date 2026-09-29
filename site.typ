#import "course.typ": term, doodle, quick-links, staff, sessions, intro
#import "assignments/pa0.typ": pa0
#import "assignments/pa1.typ": pa1
#import "syllabus.typ": syllabus
#import "assignments-page.typ": assignments-page

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

#document("assignments.html",
  title: [Assignments],
  description: [#term.course, #term.name: Assignments])[
  #shell(
    rail(term, doodle, quick-links, staff),
    html.elem("main", assignments-page)
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
      #html.elem("details", attrs: (class: "info-collapse"))[
        #html.elem("summary", [How do Help Hours Work for CSE 11?])
        #html.elem("div", attrs: (class: "info-body"))[
          #html.elem("p", [We highly encourage students to come by CSE 11 help hours for guidance on anything regarding the course! Here is how help hours work:])
          #html.elem("p", [First of all, feel free to come to any of the staff help hours that work for you, regardless of if the course staff member is a tutor, TA, or professor. If the staff member has a specific room set on the course calendar, they will be in there, but if not they will be in the CSE 11 Home Base Rooms™.])
          #html.elem("ul")[
            #html.elem("li", [On every day except Thursdays, the Home Base Room is CSE B270.])
            #html.elem("li", [On Thursdays, the Home Base Room is CSE B240.])
          ]
          #html.elem("p", [Remember that these are the big rooms, so you can just come on in, let the staff member know you are there, and get situated!])
          #html.elem("p", [
            We also use Autograder (#html.elem("a", attrs: (href: "https://autograder.ucsd.edu", target: "_blank", rel: "noopener noreferrer"), [autograder.ucsd.edu])) to manage help hour sessions. You do NOT need to use Autograder in order to get tutoring help, but it may be helpful if you do not want to be in the home base room or if there is a significantly large number of students seeking help at the same time. Annoyingly, Autograder is badly named and is not related to grading at all. Instead, you can think of it as a tutoring queue: when you arrive at the CSE basement, you can login to autograder for CSE 11 and create a ticket like below, and a tutor will come see you when it's your turn:
          ])
          #html.elem("img", attrs: (src: "assets/autograder-ticket.png", alt: "Autograder's Create Ticket form"), [])
        ]
      ]
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
#asset("assets/autograder-ticket.png", read("assets/autograder-ticket.png", encoding: none))
#asset("typst.txt", read("typst.txt", encoding: none))
