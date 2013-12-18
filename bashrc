for file in ~/dotfiles/bash/*;
do
  source $file;
done;

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /usr/share/bash-completion/completions/git
