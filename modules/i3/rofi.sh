#!/usr/bin/env bash

xdg=${${XDG_DATA_HOME}:-${HOME}/.local/share}
DIRECTORY="${xdg}/rofi/themes/"

mkdir -p "${DIRECTORY}"

for themefile in base16-rofi/**/*.rasi
do
  install "${themefile}" "${DIRECTORY}"
done
