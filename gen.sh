#!/usr/bin/env bash

document_dir="./doc/"
prepend_dir="./pre/"

mkdir --parents ./out/merge ./out/pdf

for document in "$document_dir"*.tex
do
    for macro in "$prepend_dir"*.sops.yaml
    do
        merge="./out/merge/$(basename -- $macro .sops.yaml)-$(basename -- $document .tex).tex"

        sops --decrypt -- ./def/*.sops.yaml | yq --unwrapScalar ".macros" > $merge
        sops --decrypt $macro | yq --unwrapScalar ".macros" >> $merge
        cat -- $document >> $merge
    done
done

