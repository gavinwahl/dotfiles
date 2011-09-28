#!/usr/bin/env bash
#-------------------------------------------------------
#   Generic function that most of my git "moving"
#   functions extend.  Basically ties git execution to
#   a branch and associated origin.
#-------------------------------------------------------
git_info() {
  check_git || return
  git_dir=$(git rev-parse --git-dir 2> /dev/null)

  case $1 in
    -b | --branch)
      if [[ -d "$git_dir/rebase-apply" ]] ; then
        branch="$(git symbolic-ref HEAD 2>/dev/null)"
      elif [[ -f "$git_dir/rebase-merge/interactive" ]] ; then
        branch="$(cat $git_dir/rebase-merge/head-name)"
      elif [[ -d "$git_dir/rebase-merge" ]] ; then
        branch="$(cat $git_dir/rebase-merge/head-name)"
      elif [[ -f "$git_dir/MERGE_HEAD" ]] ; then
        branch="$(git symbolic-ref HEAD 2>/dev/null)"
      else
        branch="$(git symbolic-ref HEAD 2>/dev/null)" || \
          branch="$(git describe --exact-match HEAD 2>/dev/null)" || \
          branch="$(cut -c1-7 $git_dir/HEAD)..."
      fi
      echo "${branch#refs/heads/}"
      return 1
      ;;
    -s | --dirty)
      if [[ ! "$(git status 2>/dev/null)" =~ 'nothing to commit' ]]; then
        echo '*'
      fi
      return 1
      ;;
    -d | --dir | --git-dir)
      echo $git_dir
      return 1
      ;;
    *)
      echo 'no help for you'
      return 1
      ;;
  esac
}
__git_exec_file_move()
{
  local remote=""
  local branch=$(git branch|grep \*|awk '{print $2;}')
  local command=$1
  shift

  if [ -z "$branch" ]; then
    return 1
  fi

  while [ "$1" != "" ]; do
    case $1 in
      -b | --branch )         
        branch=$2
        shift
        ;;
      -h | --help )
        echo "Usage: git ${command} [[-b branch ] | [-h]]"
        return
        ;;
      * )                     
        ;;
    esac
    shift
  done

  if [ -z "$branch" ]; then
    echo "You provided the -b flag, but did not specify a branch"
    return
  fi

  remote=$(git config branch.${branch}.remote)
  if [ -z "$remote" ]; then
    echo "There is no matching remote for branch '${branch}' in your .git/config file.  Defaulting to remote 'origin'."
    remote="origin"
  fi

  git $command $remote $branch
}
