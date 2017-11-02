# vim mode
fish_vi_key_bindings 

# balias
balias vi '/bin/vi'
#balias vi '/usr/local/bin/vim'
balias ls 'ls -A --color=auto'
balias ll 'ls -la --color=auto'
balias grep 'grep --color'
balias df 'df -h'
balias upd 'sudo yum update'
balias upg 'sudo yum upgrade'
balias rm 'rm -i'
balias yi 'sudo yum install'
#balias rm 'mv ~/trash/'

function rmi
    mv $argv ~/trash/
end

# conda
source ~/.pyenv/versions/miniconda3-latest/etc/fish/conf.d/conda.fish

# pyenv
set -x PATH $HOME/.pyenv/shims $PATH
set -x PATH $HOME/.pyenv/bin/ $PATH
source ~/.pyenv/completions/pyenv.fish

# theme
set fish_theme beloglazov

# encoding
set -x LANG en_US.UTF-8

# cd->ls
function cd
  builtin cd $argv
    ls -a
end

