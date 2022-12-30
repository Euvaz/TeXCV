# TeXCV

I wanted a specialized solution for version-controlling my resume, with the added ability of being able to generate a unique version (given a template), for different applications, all without having to manually create a new file for each implementation.

The solution I decided to implement allows for specific [LaTeX](https://www.latex-project.org/) templates to be created, and the [texout.sh](https://git.scialytic.services/Virgil/TeXCV/src/branch/main/texout.sh) utility to perform variable substitution, after first being provided a `default.env` file within the root directory, and a `*.env` file within the `./envs` directory. When used in combination with the [pdfgen.sh](https://git.scialytic.services/Virgil/TeXCV/src/branch/main/pdfgen.sh) utility, a variable-substituted pdf will be generated within the `./pdfs` directory.

## Overview

- [Usage](https://git.scialytic.services/virgil/texcv#usage)
- [Texout](https://git.scialytic.services/virgil/texcv#texout)
- [Pdfgen](https://git.scialytic.services/virgil/texcv#pdfgen)

## Usage

There are currently two primary utilities, [texout.sh](https://git.scialytic.services/Virgil/TeXCV/src/branch/main/texout.sh) and [pdfgen.sh](https://git.scialytic.services/Virgil/TeXCV/src/branch/main/pdfgen.sh).

### Texout

```
./texout.sh [TEMPLATE] [ENVIRONMENT]
```

[TEMPLATE] must be the path to the template file

[ENVIRONMENT] must be the path to the environment file.

### Pdfgen
```
./pdfgen.sh [TEMPLATE] [ENVIRONMENT]
```
