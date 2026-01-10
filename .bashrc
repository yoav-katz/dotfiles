#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bash_aliases

force_color_prompt=yes
color_prompt=yes

PS1=$'\uf0a9 '
PS1="\[\e]0;\w\a\]$PS1"

# History control
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="${HISTSIZE}"

export XDG_CURRENT_DESKTOP=Hyprland

export TERMINAL=alacritty

export EDITOR=nvim

export QT_QPA_PLATFORM=wayland


# Autocompletion
if [[ ! -v BASH_COMPLETION_VERSINFO && -f /usr/share/bash-completion/bash_completion ]]; then
  source /usr/share/bash-completion/bash_completion
fi

eval "$(starship init bash)"


if [[ -f /usr/share/fzf/completion.bash ]]; then
	source /usr/share/fzf/completion.bash
fi
 
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
	source /usr/share/fzf/key-bindings.bash
fi
export GTK_A11Y=none
