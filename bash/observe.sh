# you need to install inotify-tools
function observe()
{
  while true
  do
    eval "${@}"
    inotifywait --exclude '(^\..*\.sw..?$)|(\.pyc$)' --event modify\
                --event create --recursive . --quiet @./.tox/ @./.git/
  done
}
