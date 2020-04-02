# Usage:
#   $ ptouch file/a.txt otherfile/b.txt
#   $ tree
#      .
#      |-- file
#      |   `-- a.txt
#      `-- otherfile
#          `-- b.txt
#   $ ptouch {directory,otherdirectory}/{sub,other}/{a,b,c}.ext
#   $ tree
#      .
#      |-- directory
#      |   |-- other
#      |   |   |-- a.ext
#      |   |   |-- b.ext
#      |   |   `-- c.ext
#      |   `-- sub
#      |       |-- a.ext
#      |       |-- b.ext
#      |       `-- c.ext
#      `-- otherdirectory
#          |-- other
#          |   |-- a.ext
#          |   |-- b.ext
#          |   `-- c.ext
#          `-- sub
#              |-- a.ext
#              |-- b.ext
#              `-- c.ext

function toup() {
  while [[ -n $1 ]]
  do
      mkdir -p "$(dirname "$1")"
      touch "$1"
      shift
  done
}
