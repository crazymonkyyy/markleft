This repo exist to nail down the spefication for "markleft", a markup languge with the following charateristics:
* imperitive; while the SGML imagined humans would markup text with tags like `<important>`, the current landscape is not using this idea, html and markdown won and within those, the most common used style tag is `[bold]` an imperitive tag; all tagging should be imperitive droping the failed pretense
* a compromise on colors; Colored text is just a fact of rich text, its disclusion from markdown make it unsuitable from some tasks, while html has a complex relationship with colors where thier use is highly discoraged and css defining a color scheme is common. Simplifing htmls situation is a goal.
* a stream of charaters; poeple ussally highlight/markup a sentence or a word at a time, making a quite flat hierachy; but html has tools for complex hierachies that is unwieldly which is ussally computer generated or giving way to markdown driven website generators entirely.
* trivail to process; The parser should be quite dumb, the web is rapidly losing different web engines and of those web engines they are resource intensive and incredably complex. Firefox could die any day now leaving google and apple alone.


**I WANT CO AUTHORS**

todo list
----
* markleft to html/plaintext
* a render
* example documents
* dialics
* main spefication
* base 16 colors spec
* pepe spec
* all colors spec
* background color spec
* verifiers
* html to markleft
* changing markleft dialitics