#let assignments-page = [
  = Assignments

  #html.elem("table", attrs: (class: "assign-table"))[
    #html.elem("thead")[
      #html.elem("tr")[
        #html.elem("th", [Assignment Number])
        #html.elem("th", [Initial Deadline])
        #html.elem("th", [Resubmission Deadline])
      ]
    ]
    #html.elem("tbody")[
      #html.elem("tr")[
        #html.elem("td")[
          #html.elem("a", attrs: (href: "https://us.prairielearn.com/pl/course_instance/232999/assessment/2734979"), [PA 0])
        ]
        #html.elem("td", [October 2nd, 11:59 PM])
        #html.elem("td", [])
      ]
    ]
  ]
]
