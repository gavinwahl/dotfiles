function toup() {
  mkdir -p "$1"
  (cd "$1" && touch "${@:2}")
}
