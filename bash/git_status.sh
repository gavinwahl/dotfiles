git_status()
{
  # check for sshfs, way too slow otherwise
  if stat -f -c "%T" . | grep 'fuseblk' >/dev/null
  then
    return
  fi
  status=$(g status 2>&1)
  not_a_git=$(echo $status | grep 'Not a git' 2> /dev/null)
  is_clean=$(echo $status | grep 'nothing to commit' 2> /dev/null)
  if [ -z "$not_a_git" -a -z "$is_clean" ]; then
    echo -ne "*"
  fi
}
