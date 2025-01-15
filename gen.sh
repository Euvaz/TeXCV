#!/bin/bash

DOCUMENT_DIR="./doc/"
PREPEND_DIR="./pre/"

mkdir --parents ./out/merge ./out/pdf

for document in "${DOCUMENT_DIR}"*.tex; do
  for macro in "${PREPEND_DIR}"*.sops.yaml; do
    merge="./out/merge/$(basename -- "${macro}" .sops.yaml)-$(basename -- "${document}" .tex).tex"
    echo "[INFO] MERGING: DOCUMENT=${document} MACRO=${macro} MERGE=${merge}" >&2

    sops --decrypt "./def/Default.sops.yaml" | yq --unwrapScalar ".macros" > "${merge}"
    sops --decrypt "${macro}" | yq --unwrapScalar ".macros" >> "${merge}"
    cat -- "${document}" >> "${merge}"
  done
done

