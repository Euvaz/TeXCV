# TeXCV

I wanted a specialized solution for version-controlling my resume, with the added ability of being able to generate a unique version (given a template), for different applications, all without having to manually create a new file for each implementation.

The solution I decided to implement allows for specific [LaTeX](https://www.latex-project.org/) templates to be created, and the [texout.sh](https://github.com/euvaz/TeXCV/src/branch/main/texout.sh) utility to perform variable substitution, after first being provided a `default.env` file within the root directory, and a `*.env` file within the `./envs` directory. When used in combination with the [pdfgen.sh](https://github.com/euvaz/TeXCV/src/branch/main/pdfgen.sh) utility, a variable-substituted pdf will be generated within the `./pdfs` directory.

## Overview

- [Repository structure](https://github.com/euvaz/texcv#-repository-structure)
- [Usage](https://github.com/euvaz/texcv#usage)
- [Texout](https://github.com/euvaz/texcv#texout)
- [Pdfgen](https://github.com/euvaz/texcv#pdfgen)

## 📂 Repository structure

```
def         # TeX files which define the macros
doc         # TeX templates
out/        # Output directory
├── merge   # Merged TeX files, source files for PDFs
└── pdf     # PDF output
```

## Usage

TODO
