# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for file in ~/dotfiles/bash/*;
do
  source $file;
done;


export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /usr/share/bash-completion/completions/git
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.local/bin
export FLYCTL_INSTALL="/home/gavin/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
