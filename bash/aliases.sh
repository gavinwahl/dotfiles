alias gpfs="gpp && fab stage"
alias make='make -j 4'
alias calc='emacs -f full-calc -nw'
alias curl='curl --silent'
alias w=workon
alias tags="ctags '--exclude=*.min.*' --exclude='*/CACHE/*' -R"
alias gu='g rev-parse --show-toplevel > /dev/null && cd `g rev-parse --show-toplevel`'
alias mp='find -type f -iregex ".*\.\(mp3\|wmv\|mp4\|mkv\|flac\|avi\|iso\|vob\)$" -exec mplayer -cache 1000 {} +'
alias ma="python ./manage.py"
alias mash="ma shell_plus"
alias mars="ma runserver"
alias marsp="ma runserver_plus"
alias mag="ma migrate"
alias mam="ma schemamigration --auto"
alias rmpyc="find -name '*.pyc' -delete"
