git_status()
{
  not_a_git=$(git status 2>&1 | grep 'Not a git' 2> /dev/null)
  is_clean=$(git status 2>&1 | grep 'nothing to commit' 2> /dev/null)
  if [ -z "$not_a_git" -a -z "$is_clean" ]; then
    echo -ne "*"
  fi
}
