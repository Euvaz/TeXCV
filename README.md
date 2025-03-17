# TeXCV

I developed a specialized solution for version-controlling my resume, aiming to generate a unique version for each job application using a customizable template without the need to manually create a new file for each implementation. Furthermore, I sought to automate the process of delivering these templates and add linting features to ensure consistency and high-quality output.

To achieve this, I created a solution that enables the creation of specific LaTeX templates that can be customized using LaTeX macros. I developed a utility, [gen.sh](https://github.com/Euvaz/TeXCV/blob/main/gen.sh), that performs effective substitution of these macros.

To ensure quality and consistency in the resume generation process, I utilized the powerful CI/CD capabilities of [GitHub Actions](https://github.com/features/actions). This allows for automatic linting of new pull requests and the automatic compilation and delivery of a new =Artifact.tar.gz= to my self-hosted MinIO instance upon pushes to the main branch.

## Overview

- [Repository Structure](https://github.com/euvaz/texcv#-repository-structure)
- [Usage](https://github.com/euvaz/texcv#usage)
    - [Automation](https://github.com/euvaz/texcv#automation)
    - [Manual](https://github.com/euvaz/texcv#manual)

## 📂 Repository structure

```
def         # TeX files which define base macros
doc         # TeX templates
fonts       # Font directory
out/        # Output directory
├── merge   # Merged TeX files, source files for PDFs
└── pdf     # PDF output
pre         # TeX files which define unique macros
```

## Usage

This project can be utilized in two ways:

1. Automation: GitHub Actions
2. Manual: Executing the script and compiling the PDF(s)

### Automation

Automation will require the following action repository secrets:

| Name                  | Description                                   | Example                      |
| --------------------- | --------------------------------------------- | ---------------------------- |
| AGE_SECRET_KEY        | Age private key for SOPS decryption of macros | AGE-SECRET-KEY-...           |
| AWS_ACCESS_KEY_ID     | AWS Access Key ID                             | abcdef132456                 |
| AWS_SECRET_ACCESS_KEY | AWS Secret Access Key                         | abcdef123456                 |
| AWS_S3_ENDPOINT       | AWS S3 Endpoint                               | http(s)://s3.domain.tld:9000 |

### Manual

Manually compiling resume PDFs can be done by first generating all merge files via `gen.sh`:

```shell
$ ./gen.sh
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Amazon.sops.yaml MERGE=./out/merge/Amazon-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Google.sops.yaml MERGE=./out/merge/Google-Resume.tex
[INFO] MERGING: DOCUMENT=./doc/Resume.tex MACRO=./pre/Microsoft.sops.yaml MERGE=./out/merge/Microsoft-Resume.tex
```

Then compiling all merge files located in `./out/merge/` via `xelatex`:

```shell
$ xelatex -output-directory ./out/pdf/ ./out/merge/*.tex
```

Optionally, an individual PDF can also be generated:

```shell
$ xelatex -output-directory ./out/pdf/ ./out/merge/Google-Resume.tex
```
