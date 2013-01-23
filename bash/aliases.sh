alias gpfs="gpp && fab stage"
alias make='make -j 4'
alias calc='emacs -f full-calc -nw'
alias curl='curl --silent'
alias w=workon
alias tags="ctags '--exclude=*.min.*' --exclude='*/CACHE/*' -R"
alias gu='git rev-parse --show-toplevel > /dev/null && cd `git rev-parse --show-toplevel`'
alias mp='find -type f -iregex ".*\.\(mp3\|wmv\|mp4\|mkv\|flac\|avi\|iso\|vob\)$" -exec mplayer -cache 1000 {} +'
