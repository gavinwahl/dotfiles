# you need to install inotify-tools
function observe()
{
  ($@)
  while inotifywait --exclude '^\..*\.swp.?$' --event modify --recursive . --quiet
  do
    $@
  done
}
