git() {
  if [[ "$1" == "clone" ]]; then
    command git clone "${@:2}"
    echo "	Apply git hooks  "
  else
    command git "$@"
  fi
}

cd() {
  if [[ "$1" == //* ]]; then
    command cd ..
  else
    command cd "$@"
  fi
}

echo() {
  if [[ "$#" -eq 1 ]] && [[ "${1:-}" = "$PATH" ]]; then
    command echo "$PATH" | tr ':' '\n'
  else
    command echo "$@"
  fi
}

copy-branch() {
  git rev-parse --abbrev-ref HEAD | copy
}

unzip() {
  if [[ -z "$1" ]]; then
    echo "Usage: unzip <file.zip>"
    return 1
  fi
  local dirname="${1%.zip}"
  dirname="${dirname// /-}"
  command unzip "$1" -d "$dirname"
}

