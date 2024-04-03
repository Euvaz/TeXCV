#!/usr/bin/env bash

document_dir="./doc/"
prepend_dir="./pre/"

mkdir --parents ./out/merge ./out/pdf

for document in "$document_dir"*.tex
do
    for macro in "$prepend_dir"*.sops.yaml
    do
        merge="./out/merge/$(basename -- "$macro" .sops.yaml)-$(basename -- "$document" .tex).tex"
        echo "[INFO] MERGING: DOCUMENT=$document MACRO=$macro MERGE=$merge" >&2

        sops --decrypt -- ./def/*.sops.yaml | yq --raw-output ".macros" > "$merge"
        sops --decrypt "$macro" | yq --raw-output ".macros" >> "$merge"
        cat -- "$document" >> "$merge"
    done
done

