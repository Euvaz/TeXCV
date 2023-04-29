# TeXCV

I wanted a specialized solution for version-controlling my resume, with the added ability of being able to generate a unique version (given a template), for different applications, all without having to manually create a new file for each implementation.

The solution I decided to implement allows for specific [LaTeX](https://www.latex-project.org/) templates to be created, and the [gen.sh](https://github.com/Euvaz/TeXCV/blob/main/gen.sh) utility to effectively perform substitution using [LaTeX Macros](https://en.wikibooks.org/wiki/LaTeX/Macros), after first being provided a `./def/*.tex` file(s). A `./pre/*.tex` file will also need to be created, however it can be left completely empty if all values will be specified in the `./def/*.tex` file(s).

## Overview

- [Repository structure](https://github.com/euvaz/texcv#-repository-structure)
- [Usage](https://github.com/euvaz/texcv#usage)
- [Examples](https://github.com/euvaz/texcv#examples)

## 📂 Repository structure

```
def         # TeX files which define base macros
doc         # TeX templates
fonts       # Font directory
out/        # Output directory
├── merge   # Merged TeX files, source files for PDFs
└── pdf     # PDF output
pre         # TeX files which defined unique macros
```

## Usage

`./gen.sh`

## Examples

### Manually compiling a specific Resume PDF.


Run `./gen.sh` to generate all merge files:

```bash
$ ./gen.sh
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/amazon.sops.yaml MERGE=./out/merge/amazon-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/google.sops.yaml MERGE=./out/merge/google-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/microsoft.sops.yaml MERGE=./out/merge/microsoft-Resume.tex
```

Compile the `amazon-Resume.tex` into a PDF using `xelatex`:

```bash
$ xelatex -output-directory ./out/pdf/ ./out/merge/amazon-Resume.tex
```

