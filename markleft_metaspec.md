Markleft is a family of markup languges, that aims to be humane, trivail to parse, featureful imparvtive rich text.

##design goals

1. Limit the number of charaters given specail meaning, spefically to []'s
2. Allow for color.
3. Trivail to learn. Espially for poeple who know html.
4. Compact and computationally limited.
5. realistic about how real world humans actaully write markup text.
6. tokinizing can roughly be shared between different dialics correctly.

##Cheat sheet
```
[a]||[aa]: style tag
[aaa] : color tag
[] : reset
[pepe] : emote (human section)
[background] : control code (system section)
[monkyyy.science] : reasource

[[] : [ litteral
[]] : ] litteral

][ :anounous block seperator
]$meta[ : system block
]body[ : human block
```


##Definations

Tag: substring that marked by starting and ending []'s that contains semtenic meaning

Text: string of charaters that with isnt in a tag

Metatag: tag starting with ] and ending with [ that contains infomation about blocks

Minor tag: tag starting with [ and ending with ] that contains style or pysduo text infomation

Block: a linear collection of minor tags and text, named after the starting metatag

Charater: The smallest unit of a text encoding, probaly utf-8

Simple charater: a charater that isnt '[' or ']' or endline

Endline: "/n" whatever

Alphanumeric: a charatar that is a-z A-Z 0-9

Symbol: a simple charater that isnt alphamumeric

Color handling: A function that defines how a 3 letter alphanumeric string is converted into a color

Emote: a text sized image, that is inlined with text

Reasource: link or path to a outside data, i.e a hyperlink or inlined image

Style: imperitive effect on look of text, i.e. bold

Sub-dialect: .... idk todo

Color sub-dialect: A spec that defines colorhandling i.e. a list of valid colors

Emote sub-dialect: A spec that defines a list of valid emotes

Style sub-dialect: A spec that defines style tags, control codes and reasource handling

Dialect: a conbination of a color, emote and style sub-dialect

Dialect name: "markleft-$(Color sub-dialect)-$(Emote sub-dialect)-$(Style sub-dialect)"

Document type: some sort of human readable declaration of what the following document is, document, webpage, slideshow.

Starting statement: "This $(document type) was written with $(dialect-name)"

##Formalish style tag definations

Block seperator: a meta tag that is exactly "][", makes a human block. SHOULD be on its own line

System block: a meta tag that (the containing string) starts with symbol, should not be displaied to an end user, contains control code and not emotes. SHOULD be on its own line

Human block: a meta tag that starts with an alphanumbertic, should be displaied the the end user, contains emotes that control codes. SHOULD be on its own line


Style tag: a tag that conatins 1 or 2 simple charaters, that additive adds to the style for future text

Color tag: a tag that conations 3 alphanumeric charaters, that replaces the color for future text

Reset tag: a tag that is exactly "[]" and which the next charater in the input stream isnt a ']'; that returns style and color to a defualt state. Endlines SHOULD act as reset tags.

Reasource tag: a tag that contains more the 3 charaters with at least 1 of which is a symbol. Points to outside data, such as an image or a link

Emote: a tag that contains more then 3 charater with NO symbols, when inside a human section. Should be a small image that is inlined.

Control code: a tag that contains more then 3 charater with NO symbols when inside a system section. SHOULD be the start of the line and only care about the rest of the line


Bracket litterals: minor tags of exactly 1 length with a nonsimple charater. Passes the 1 charater to the text rendering system. (undefined but, maybe if you pass an "[/n]" dont reset style?)

## Document format

Documents SHOULD start with $meta block, followed by a starting statement.
