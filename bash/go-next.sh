#!/bin/bash
go-next() {
  cur=${PWD##*/}
  cur="../${cur:-/}/"
  switch=false

  for dir in ../*/;
  do
    if [[ "$switch" = "true" ]];
    then
      cd "$dir";
      return 0;
    fi
    if [[ $cur = "$dir" ]];
    then
      switch=true
    fi;
  done;
  echo nowhere to go
  return 1;
}
