# remove the current directory if it's empty
function rmd() {
  thisdir=`pwd`
  cd ..
  rmdir "$thisdir" || cd "$thisdir"
}
