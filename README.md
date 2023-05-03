# TeXCV

I developed a specialized solution for version-controlling my resume, aiming to generate a unique version for each job application using a customizable template without the need to manually create a new file for each implementation. Furthermore, I sought to automate the process of delivering these templates and add linting features to ensure consistency and high-quality output.

To achieve this, I created a solution that enables the creation of specific LaTeX templates that can be customized using LaTeX macros. I developed a utility, [gen.sh](https://github.com/Euvaz/TeXCV/blob/main/gen.sh), that performs effective substitution of these macros.

To ensure quality and consistency in the resume generation process, I utilized the powerful CI/CD capabilities of [GitHub Actions](https://github.com/features/actions). This allows for automatic linting of new pull requests and the automatic compilation and delivery of a new `Artifact.tar.gz` to my self-hosted Nextcloud instance upon pushes to the main branch.

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
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Amazon.sops.yaml MERGE=./out/merge/Amazon-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Google.sops.yaml MERGE=./out/merge/Google-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Microsoft.sops.yaml MERGE=./out/merge/Microsoft-Resume.tex
```

Compile the `Amazon-Resume.tex` into a PDF using `xelatex`:

```bash
$ xelatex -output-directory ./out/pdf/ ./out/merge/Amazon-Resume.tex
```

