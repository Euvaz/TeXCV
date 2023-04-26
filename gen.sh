#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  exit 1
fi

target="$1"
pre="$2"

mkdir --parents out/merge out/pdf

merge="out/merge/$(basename -- $pre .sops.yaml)-$(basename -- $target .tex).tex"

if [ -d def ]; then
  sops --decrypt -- def/*.sops.yaml | yq --unwrapScalar ".macros" > $merge
  sops --decrypt $pre | yq --unwrapScalar ".macros" >> $merge
  cat -- $target >> $merge
else
  sops --decrypt $pre | yq --unwrapScalar ".macros" > $merge
  cat -- $target >> $merge
fi

xelatex -output-directory out/pdf $merge
