# resume_builder_pandoc

## Description
Build resumes using [pandoc](https://pandoc.org/).

[TStark](samples/05222023_resume.png)

## Requirements
- [pandoc](https://pandoc.org/)

## Installation
```
git clone https://github.com/wilbura009/resume_builder_pandoc.git
```

## Usage
Use the `build.sh` to run the demo and copy files from src.

```
Usage: ./build.sh [OPTION]
 -n, --new       create a new resume project folder
 -d, --demo      build the demo folder
 -h, --help      display this help and exit
```

The project structure is as follows:

```
└── src
    ├── components
    │   └── components.sty  <-- Commands for formatting sections (mostly).
    ├── demo
    │   └── yaml
    │       └── meta.yaml   <-- Variables that can be edited to create your output pdf based on the template.
    ├── makefile            <-- Produces the pdf
    ├── template.tex        <-- Lays out the document using the components, variables, and a few latex commands.
```

Typical usage would be:

1. `build.sh -n`
2. `cd <proj>`
3. `make`

Once you've ran `build.sh -n` the first time you can get rid you the other files if you like. 

### Example
```sh
wb:resume_builder_pandoc$ ./build.sh -n
Enter the name of the new resume project folder: bestCo
wb:resume_builder_pandoc$ cd bestCo/
wb:bestCo$ make
if [ -e *.pdf ]; then rm *.pdf; fi
pandoc --pdf-engine=xelatex --include-in-header=components/components.sty --template=template.tex yaml/meta.yaml -o 05222023_resume.pdf
[WARNING] Could not deduce format from file extension .yaml
  Defaulting to markdown
wb:bestCo$
wb:bestCo$ l
05222023_resume.pdf  components/  makefile  template.tex  yaml/
```

## Additional Info
- A sample resume create by this is located in [samples](./samples).
- The resume template is based on [Template](https://docs.google.com/document/d/1VMLTAZx12Vug-jg4OrtXZ2vouNyJ1CIY/edit) which was provided by some folks at [EngineeringResumes](https://www.reddit.com/r/EngineeringResumes/comments/m2cc65/new_and_improved_wiki/).
- The presentation section is to include [revealjs](https://revealjs.com/) demos. I used it before and thought it was cool.


---

Happy Hunting. 🦆
