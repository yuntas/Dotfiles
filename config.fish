# vim mode
fish_vi_key_bindings

# balias
balias vi '/usr/local/bin/vim'
balias ls 'ls -A --color=auto'
balias ll 'ls -la --color=auto'
balias grep 'grep --color'
balias df 'df -h'
balias upd 'sudo apt update'
balias upg 'sudo apt upgrade'
balias rm 'rm -i'

# conda
source /home/yumin/.pyenv/versions/anaconda3-4.3.1/etc/fish/conf.d/conda.fish

# pyenv
set -x PATH $HOME/.pyenv/shims $PATH

# theme
set fish_theme bobthefish

# encoding
set -x LANG ja_JP.UTF-8 
