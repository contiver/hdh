# Completions
autoload -Uz compinit
compinit

zstyle :compinstall filename '$HOME/.zsh/.zshrc'

autoload -U promptinit
promptinit
autoload -U colors && colors
setopt completealiases

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%m %~ $"
PROMPT="┌─[ %{$fg[cyan]%}%m%{$fg_bold[blue]%} %~ %{$fg_no_bold[yellow]%}%(0?..%?)%{$reset_color%}]
└─╼ "
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# History options
export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=$((HISTSIZE/2))
setopt HIST_IGNORE_DUPS

bindkey -v
bindkey "$(echotc kl)" backward-char
bindkey "$(echotc kr)" forward-char
bindkey "$(echotc ku)" up-line-or-history
bindkey "$(echotc kd)" down-line-or-history

#### Alias ####
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cd2='cd ../../'
alias pong="ping -c 3 www.google.com"

export PATH="${PATH}:`ruby -rubygems -e 'puts Gem.user_dir'`/bin:/home/contiver/builds/idea-IC-135.690/bin:/opt/android-sdk/tools/:/opt/android-sdk/platform-tools/"

# Show vi mode
function zle-line-init zle-keymap-select {
    RPS1="%{$fg[magenta]%}${${KEYMAP/vicmd/%B Command Mode %b}/(main|viins)/ }"
    RPS2=$RPS1
    zle reset-prompt
}
