#!/usr/bin/env bash

if [[ $# != 2 ]]; then
  exit 1
fi

texname="$1"
varname="$2"
texfile="$texname.tex"
varfile="envs/$varname.env"

mkdir --parents "conv/$varname"
mkdir --parents "pdfs/$varname"
cp --recursive fonts "conv/$varname"
./texout.sh "$texfile" "$varfile" > "conv/$varname/$texname.tex"
latexmk -xelatex -cd "conv/$varname/$texname.tex"
rm -rf "conv/$varname/fonts"
mv "conv/$varname/$texname.pdf" "pdfs/$varname"
