#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="~/.jdks/corretto-1.8.0_462/bin:~/.local/bin:$PATH"

if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
