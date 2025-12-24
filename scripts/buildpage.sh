#!/bin/bash

function buildpage {
  FILE="${1#pages/}"
  TITLE=$(head -n1 "${1}")
  DATE=$(LC_TIME=fr_FR.UTF-8 date "+%d %b %Y")
  sed -e "s~href=\"${FILE}\"~& class=\"current\"~g" -e "s~{{TITLE}}~${TITLE}~g" layout/before.html
  tail -n +2 "${1}"
  sed "s~{{DATE}}~${DATE}~g" layout/after.html
}

if [[ "${1}" = "" ]]; then # premier argument obligatoire : le nom de la page
  echo "Usage: ${0} PAGE" >&2
  exit 1
elif test ! -f "${1}"; then # et doit correspondre à une page existante
  echo "${0}: error: ${1}: no such file" >&2
  exit 1
else # si tout va bien on construit la page dans public/
  FILE="${1#pages/}"
  buildpage "${1}" > "public/${FILE}"
fi
