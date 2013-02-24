# make a temporary working directory

function tmpd() {
  if [ ! -d ~/tmp/ ]
  then
    mkdir ~/tmp/
  fi;
  cd ~/tmp/
  i=""
  dir=`date +%F`
  while [ -d "$dir" ]
  do
    i=$(( $i + 1 ))
    dir="`date +%F`.$i"
  done
  mkdir "$dir"
  cd "$dir"
}
