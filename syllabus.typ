#import "lib/site.typ": link-out


#let syllabus = [

  *This syllabus is a draft until the first lecture happens and this notice is
  removed.*

  = Grading <grading>

  Your grade will be calculated from three categories:

  - *Social Learning and Engagement*
  - *Assignments*
  - *Exams*

  == Social Learning and Engagement

  Part of learning is being involved in a community of people. (It's impossible
  to learn without reference to others; even if you sit on your own and read a
  book, someone wrote it, if you use a LLM, people built it).
  #link-out("https://files.eric.ed.gov/fulltext/EJ1044018.pdf")[Communicating, not
  just consuming], is crucial for how knowledge gets stored in your brain.

  Each week there are *readings*, *lectures*, and *discussions*. The readings
  make sure you come to class with something to talk about, and the lectures and
  discussions are where you'll talk about them with others and do the talking.

  Each week there are 8 points of social learning credit available:

  - 2 for each lecture (total 4)
  - 1 for attending discussion
  - 2 for completing readings
  - 1 for significant interaction on Piazza or attending office hours

  == Assignments

  We plan 6 assignments (due Fridays in weeks 1, 2, 4, 6, 8, and 10) that will
  have a mix of programming and writing about programs.

  Most assignments will have an *initial deadline* and a *review/resubmission
  deadline*. The review/resubmission deadline will be around 2 weeks after the
  initial deadline. It will have a mix of similar and new tasks that you can do
  to make up for lost credit on the first submission, and tasks that involve
  reviewing other students' work.

  This is the only late policy for assignments – if you miss the initial
  deadline you can resubmit the modified work at the resubmission deadline.

  Initial submissions are graded out of 4 points:

  - *4*: Complete, only minor errors or feedback across all parts
  - *3*: Some errors or incompleteness, most parts complete and correct
  - *2*: Significant errors in multiple parts, several parts incomplete
  - *1*: Non-empty submission of some parts of the assignment
  - *0*: Not submitted/not attempted

  Resubmissions are graded in part based on feedback on the initial submission.
  For a score of *0* or *1* on the initial submission, the maximum score on a
  resubmission is *3*. For a score of *2* or *3* on the initial submission, the
  resubmission score can reach *4*.

  == Exams

  We will have 3 exams during the quarter, flexibly scheduled through the UCSD
  CBTF, in weeks 3, 6, and 9. In *finals week*, you will have the opportunity to
  *retry* any of the exams – the retries will have different questions that test
  similar content.

  Exams during the quarter are 45m long; you can reserve a *single* final exam
  retry slot for 2h, in which you attempt any or all of the retry exams.

  Exams are graded out of 4 points. The sum of question points may add up to
  more than 4; we will publish the point-specific cutoffs after we finish
  grading each exam. Exams will have a mix of questions, with some involving
  programming in Java without access to the internet or agentic programming
  tools.

  == Grade Categories and Philosophy

  A slogan for the course's grading policy is *High Standards, Multiple Tries*.
  Most course components have chances to make up or otherwise improve your
  score; most students make use of some of these opportunities, and few students
  submit full-scoring work on all of their first attempts (the course is
  designed to be challenging). In addition, we think that *all* of the course
  components are important. To earn a A, B, or C in the course, you need to
  achieve A, B, or C level scores in *all three* categories:

  - For an *A*, score:
    - *62* or more social learning points, and
    - *21* or more assignment points, and
    - *10* or more exam points
  - For a *B*, score:
    - *54* or more social learning points, and
    - *18* or more assignment points, and
    - *8* or more exam points
  - For a *C*, score:
    - *48* or more social learning points, and
    - *15* or more assignment points, and
    - *6* or more exam points

  D grades are not given (if the C thresholds are not reached, a F or NP is the
  final course grade). Other pluses and minuses will be given around the
  boundary of these scores by consistent policy not published in advance. The
  plus/minus policy will *not* consider exam retries, so if you have A-level
  exam credit after the three in-quarter exams, there is no grade incentive to
  retry exams.

  Requests to change this grading policy (for a specific student or class-wide)
  will be denied with a link to this syllabus section. Consider this: we may, as
  instructors, decide for academic reasons that the most accurate way of
  assigning letter grades in the class needs to change. However, it would be
  inappropriate for us to do so in response to student requests: that could
  create an appearance that we give students the grades they ask for rather than
  the grades that represent their achievement.

  == Make-up Work, Missed Work, and Special Circumstances

  Our intent is that no extensions or make-up work is given outside of these
  policies. If you miss an assignment, use the resubmission deadline. You can
  miss many lectures, discussions, or readings with no impact on your course
  grade, so no make-up options are given for missing those. If you miss an exam,
  there are retry opportunities in finals week. These are all designed to
  naturally handle the case where you miss up to a week of the course with no
  special syllabus changes. Do not send us medical records or other
  documentation to justify absences.

  If you do miss more than a week of work in the course, or if you want help
  applying these policies to a specific situation you find yourself in, or if
  there is an accommodation you need not covered by these polices, please email
  both instructors so we can advise.
    
  = 🤖 AI, CSE-011, and You <ai-tool-policy>
  
  == AI and Writing

  It is your responsibility to make sure that any *writing* (prose) you submit
  under your name is representative of *your* thoughts and positions. It is not
  good if you answer “What did you mean by this sentence?” with either “Oh
  sorry, AI wrote that” *or* “Oh I don't know what I meant there”.
  
  The easiest way to avoid issues is to do all the writing yourself. It's one of
  the main places where using AI almost always replaces your own thinking, to
  your detriment. Note that this does not mean “you can't use AI to help you
  write”; many tools can be useful for proofreading, checking, filling in parts
  of examples, brainstorming, etc. But don't let that turn into AI doing the
  thinking and decision-making for you.

  It's also a matter of respect – when you write prose for *other humans*, it's
  rude to delegate it to an agent if it was meant for communication between
  humans: it would be weird to show up to office hours and use your phone to
  speak for you. It also erodes confidence in human communication when our
  individual voices are flattened out into one provided by a major AI company.
  Alex Hillman has a great short piece on this; I think the key line is [“don’t
  ask the recipients of your work to try harder than you
  did”](https://jfdi.bot/blog/ai-generated-content-broke-the-social-contract).

  You _can_ lose credit for this on assignments where we grade writing, or where
  you write feedback or reviews of code or other student work. We will deduct
  credit for (our judgment of) *bad writing*, not for AI-generated writing
  specifically; the two just often happen to overlap.

  We will not use generative AI to write substantial communications with you,
  either. We confidently claim authorship of the content of these pages. We do
  use Claude and other assistants to help us proofread them, and fill in
  metadata like schedule details and so on, but the text we write ourselves.

  We *may* use AI to help us with parts of grading your work; this will be
  clearly explained and labelled, and be accompanied by human review.

  == AI and Coding
  
  Individual assignments may encourage or discourage the use of external tools
  like coding agents or chatbots.

  In general, for take-home programming work, these guidelines are for your
  _learning_, rather than something we try to enforce. Here's an analogy:

  #quote(block: true)[ Consider physical conditioning, let's take running for
  fitness in particular. There are many machines in the world that are
  remarkably effective at moving people around: electric scooters for example.
  Taking a scooter for a few miles gets you to your destination more quickly and
  less sweatily than running, but completely misses the point of the run. The
  goal of running for fitness has little to do with getting to a destination and
  everything to do with the changes that happen inside your body. Many people
  can run the same miles on the same road and get the benefits from it, despite
  them all doing the same work that a machine (the scooter) could have done. ]

  Programming is also necessarily collaborative, and often builds on past work.
  As a general rule, you can use code that we provide or that you develop with
  other students in this class. If you use code that you developed with other
  students, got from Piazza, or got from the internet, say so, including the
  source and which students you worked with in CREDITS.txt. All of the writing
  in assignments (e.g. in open-ended written questions) must be your own.

  If you use an AI agent or other similar tool to help write code, disclose it!
  In CREDITS.txt include a few sentences about which tools you used and which
  specific parts of the assignment they helped with.

  If you don't include a CREDITS.txt and it's clear you included code from
  others or from an AI tool, you may lose credit, have to do a resubmission, or
  get a 0 on the assignment. Repeated or severe violations can be escalated
  to reports of academic integrity violations.

  = Other Policies

  == Exam Integrity

  It is a violation of academic integrity to share details of your exam with
  others until after you receive your grade for it. Keep in mind that the exams
  are randomized to discourage casual cheating, so your exam may not be the same
  one that others see. It is a violation of academic integrity to communicate
  with anyone other than the official proctors during the exam, or to use
  devices other than the ones you are using to complete the exam.

  == Lecture and Discussion Integrity

  It is a violation of academic integrity to submit work for someone else in
  lecture or discussion, when handouts or other attendance mechanisms are used.
  You also should not try to submit handouts or worksheets for sessions you did
  not attend in person.

  == In-class Professionalism

  === Devices

  To a large degree, you are responsible for managing your time, attention, and
  learning in lecture, and I hesitate to make policies that attempt to govern or
  restrict your choices with respect to note taking or device use. However,
  lecture is a communal space, and your actions can affect others' learning. In
  particular, what you have on your screen may be unavoidably in the field of
  view of other students. Because of this, you are responsible for a fragment of
  the attention of everyone in a cone of space behind you. With this in mind,
  the policy for lecture is that if you use a device, you must have
  lecture-related content onscreen. There is even research that shows that the
  content of screens in the classroom, even quite far away, can have a
  detrimental effect on learning. If you cannot resist checking social media,
  playing a game, or doing other off-topic tasks during lecture, sit in the back
  2 rows so that you are only having an effect on your own attention, or the
  attention of others with a similar mindset.
  
  === Collaboration

  Some lecture and discussion work may be highly collaborative, and designed to
  encourage communication between students. Some of the activities will have you
  talk to other students, or exchange code, ideas, or commands with other
  students, and write down what happened.
  
  In all of this communication, remember to be polite, professional, and focus
  on the work. A huge part of the job of a working software professional or
  researcher is professional and clear communication.
  
  Some tricks for this: avoid statements that reference the author of the code,
  frame negative feedback as possible improvements or ways your expectations
  were violated, and take responsibility for anything you don't understand.
  
  Examples:
  
  - Don't say “You were wrong here: ...” Instead say “On line I expect the
  condition to be true but I think it will be false because XYZ ... we could
  demonstrate that by doing ABC.”
  - Don't say “It seems like you don't know about...”, instead say “On line
  10-12, these 3 lines could be shortened into one line using method chaining:
  ....” And use some judgment: it's likely that some of the advice you'd give is
  helpful and constructive, and some of it is just showing off.
  - Don't say “That conditional is ugly:...” Instead say “I find it easier to
  read these conditions when they are written as .... because ...” If you don't
  have a good explanation to put after the “because”, how do you know it's a
  good suggestion?
  - Don't say “You wrote lines 20-24 very confusingly.” Instead say “I'm having
  trouble understanding lines 20-24. It would help me to work through an example
  of how that part is supposed to work”


  == Student Conduct Policy

  UC San Diego strives to maintain a climate of fairness, cooperation, and professionalism. It is expected that you practice basic principles, including, but not limited to, mutual respect, civility, and decency, towards maintaining an atmosphere free of abusive or demeaning treatment. Non-academic student misconduct will be reported to the Center for Student Accountability, Growth, and Education for violating UC San Diego's Principles of Community.

  == Diversity and Inclusion

  We are committed to fostering a learning environment for this course that supports a diversity of thoughts, perspectives, and experiences while respecting your identities (including race, ethnicity, heritage, gender, sex, class, sexuality, religion, ability, age, educational background, etc.). Our goal is to create an inclusive learning environment where all students can feel comfortable and thrive. Accordingly, the instructional staff will make a concerted effort to be welcoming and inclusive to the wide range of students in this course. If there is some way we can help you feel more included, please let one of the course staff know (in person, via email/Piazza, or even using an anonymous note).

  We also expect that you, as a student in this course, will honor and respect your classmates, abiding by the UC San Diego Principles of Community. Please understand that others' backgrounds, perspectives, and experiences may be different than your own, and help us build an environment where everyone is welcomed and respected.

  If you experience any sort of harassment or discrimination, please contact an instructor as soon as possible. If you prefer to speak with someone outside of the course, please contact the Office for the Prevention of Harassment and Discrimination.


  == Students with Disabilities

  We aim to create an environment in which all students can succeed. If you have a disability, please contact the Office for Students with Disabilities (OSD) and discuss appropriate accommodations as soon as possible. We will work to provide you with the accommodations you need, but you must first provide a current Authorization for Accommodation (AFA) letter issued by the OSD. You are required to present your AFA letters to the instructor and to the department's OSD Liaison so that accommodations may be arranged.
  
  
  == Basic Needs/Food Insecurities
  
  If you are experiencing any insecurities related to basic needs (food, housing, financial resources), there are resources available on campus to help, including The Hub and the Triton Food Pantry. Please visit The Hub for more information.


]
