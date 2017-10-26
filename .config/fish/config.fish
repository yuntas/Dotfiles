# vim mode
fish_vi_key_bindings 

# balias
balias vi '/usr/local/bin/vim'
balias ls 'ls -A --color=auto'
balias ll 'ls -la --color=auto'
balias grep 'grep --color'
balias df 'df -h'
#balias rm 'mv ~/trash/'

function rmi
    mv $argv ~/trash/
end
# ubuntu setting
balias upd 'sudo apt update'
balias upg 'sudo apt upgrade'

# conda
source ~/.pyenv/versions/anaconda3-4.4.0/etc/fish/conf.d/conda.fish

# pyenv
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH $HOME/.pyenv/bin/ $PATH
source ~/.pyenv/completions/pyenv.fish

# theme
#set fish_theme bobthefish

# encoding
set -x LANG ja_JP.UTF-8

# cd->ls
function cd
  builtin cd $argv
    ls -a
end

