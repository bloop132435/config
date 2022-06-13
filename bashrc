export PATH=$PATH:~/programs/scripts/
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.config/tmux
export PATH=$PATH:~/downloads/squashfs-root/usr/bin
export PATH=$PATH:/home/gqian/cling/bin
export PATH=/opt/homebrew/bin:$PATH
export PATH=/Users/gqian/Library/Python/3.8/bin:$PATH
# export DOTNET_ROOT=$HOME/dotnet
# export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/programs/utils/webscraping
export PYTHONPATH=$PYTHONPATH:$HOME/.vim/plugged/ultisnips/pythonx
export FZF_DEFAULT_COMMAND="fd -E .git/ -E iterm2 -H -L  --strip-cwd-prefix"
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERMINAL=st
export FZF_DEFAULT_OPTS='--tabstop=4 --preview="~/.config/nvim/preview.sh {} " --layout=reverse --border  --color=fg:#f8f8f2,bg:-1,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:-1,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_COMPLETION_TRIGGER='##'
alias v=nvim
alias l=exa\ -a
alias ll=exa\ -al
alias ls=exa
alias q=exit
alias python=python3

if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
  alias nvim='nvr'
fi

vf(){
	nvim $(fzf)
}
calc(){
	printf "%s\n" "$@" | bc -l;
}
function cf() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && \ls -ap | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p --color=always "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}


# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac


if [ "$TERM" = "linux" ]; then
	printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
	printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
	printf %b '\e]P0181a26'    # redefine 'black'          as 'dracula-bg'
	printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
	printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
	printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
	printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
	printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
	printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
	printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
	printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
	printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
	printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
	printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
	printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
	printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
	printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
	printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
	clear
fi

# source /usr/share/fzf/key-bindings.bash
# source /usr/share/fzf/completion.bash
source /opt/homebrew/Cellar/fzf/0.30.0/shell/completion.bash
source /opt/homebrew/Cellar/fzf/0.30.0/shell/key-bindings.bash

eval "$(starship init bash)"

. "$HOME/.cargo/env"
