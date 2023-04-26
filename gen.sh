#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  exit 1
fi

target="$1"
pre="$2"

mkdir --parents out/merge out/pdf

merge="out/merge/$(basename -- $pre .tex)-$(basename -- $target .tex).tex"

if [ -d def ]; then
  cat -- def/*.tex $pre $target > $merge
else
  cat -- $pre $target > $merge
fi

xelatex -output-directory out/pdf $merge
