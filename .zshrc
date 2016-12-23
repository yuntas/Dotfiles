#####autload#####
# zsh prompt setting
autoload -Uz promptinit && promptinit
prompt adam1

# Use modern completion system
autoload -Uz compinit && compinit -u

autoload colors && colors
#####setopt#####
setopt histignorealldups sharehistory
setopt magic_equal_subst
setopt auto_param_slash
setopt prompt_subst

#####history#####
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

######ls color#####
export LSCOLORS=gxfxcxdhbxegehabahhfhg
export LS_COLORS="di=36;49:ln=35;49:so=32;49:pi=33;47:ex=31;49:bd=34;46:cd=34;47:su=30;41:sg=30;47:tw=37;45:ow=37;46"
zstyle ':completion:*' list-colors 'di=36;49' 'ln=35;49' 'so=32;49' 'pi=33;47' 'ex=31;49' 'bd=34;46' 'cd=34;47' 'su=30;41' 'sg=30;47'  'tw=37;45' 'ow=37;46'

######ls util#####
setopt auto_cd
function chpwd() { ls -a --color=auto}

#####zplug#####
# Zplug init
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "b4b4r07/enhancd", use:init.sh
zplug check || zplug install
zplug load --verbose
#####aliases#####
alias ls='ls -a --color=always'
alias vi='nvim'
alias grep='grep --color'

#####keybind#####
# Use vi keybindings
bindkey -v

#####zstyle#####
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
