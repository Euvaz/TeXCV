#!/usr/bin/env bash
set -euo pipefail

shopt -s extglob globstar nullglob

function parsefmt() {
  local output slice vars fmt
  declare -A vars

  fmt="$1"

  shift

  for assign in "$@"; do
    if [[ "$assign" =~ ([a-zA-Z_][a-zA-Z0-9_]*)=(.*)$ ]]; then
      local name val
      name="${BASH_REMATCH[1]}"
      val="${BASH_REMATCH[2]}"
      vars["$name"]="$val"
    else
      echo "$assign"
      return 1
    fi
  done

  for ((i = 0; i < ${#fmt}; i++)); do
    slice="$i"
    if [[ "${fmt:i:1}" == '!' ]]; then
      ((i++))
      if [[ "${fmt:i:1}" == '!' ]]; then
        output+='!'
        continue
      elif [[ "${fmt:i:1}" == '[' ]] && ((i < ${#fmt})); then
        ((i++))
        if [[ "${fmt:i:1}" != ']' ]] && ((i < ${#fmt})); then
          local subst
          subst=''
          if [[ "${fmt:i:1}" =~ [a-zA-Z_] ]]; then
            subst+="${fmt:i:1}"
            ((i++))
            while [[ "${fmt:i:1}" =~ [a-zA-Z0-9_] ]] && ((i < ${#fmt})); do
              subst+="${fmt:i:1}"
              ((i++))
            done
            if [[ "${fmt:i:1}" == ']' ]]; then
              if [[ -v "vars[$subst]" ]]; then
                output+="${vars["$subst"]}"
                continue
              fi
            fi
          fi
        fi
      fi
    fi
    len="$((i + 1 - slice))"
    output+="${fmt:slice:len}"
  done

  printf '%s\n' "$output"
}

if [[ $# != 2 ]]; then
  exit 1
fi

texfile="$1"
varfile="$2"

assignments=()

for curfile in default.env "$varfile"; do
  while IFS="" read -r line; do
    if [[ -n "$line" ]]; then
      assignments+=("$line")
    fi
  done < "$curfile"
done

parsefmt "$(cat -- "$texfile")" "${assignments[@]}"
