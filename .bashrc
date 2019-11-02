# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

(cat ~/.cache/wal/sequences &)

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -n "$DISPLAY" ] ; then
  tmux || exec tmux new -s default && exit ;
fi

alias ls='ls --color=auto'
alias vi='vim'
alias xinstall='sudo xbps-install'
alias brightness='xbacklight'
alias weather='curl wttr.in/Athens.Greece'
alias wea='cat ~/.local/share/weatherreport'
#alias weatherupdate='curl wttr.in/Athens?format=1 > ~/.local/share/weatherreportShort && curl wttr.in/Athens > ~/.local/share/weatherreport'
alias weatherupdate='(rm ~/.local/share/weatherreport) || true && dwm_weather.sh'
alias programs='echo /usr/local/bin && cd /usr/local/bin'
alias pdf='zathura'
alias wifi-connect='sudo wifi-connect'
alias youtube-full-download="youtube-dl --write-description --write-thumbnail -o '~/Downloads/%(title)s by %(uploader)s on %(upload_date)s/%(title)s.%(ext)s' -f worstvideo+worstaudio " 
alias youtube-full-download-best="youtube-dl --write-description --write-thumbnail -o '~/Downloads/%(title)s by %(uploader)s on %(upload_date)s/%(title)s.%(ext)s' " 
alias restart='sudo shutdown -r now'
alias turnoff='sudo shutdown -P now'
alias stream='mpv --ytdl-format=worst'
#alias tmuxClear="tmux list-sessions | grep -E -v '\(attached\)$' | while IFS='\n' read line; do  tmux kill-session -t \"${line%%:*}\" done"
alias neofetch='neofetch --disable packages uptime shell'
alias project='cd ~/sholh/Project'
alias todo='todo.sh'
alias tdo='todo.sh'

#auto completion for todo.sh
source ~/Programs/todo.txt-cli/todo_completion
complete -F _todo todo
complete -F _todo tdo

PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/void/Programs/
export PATH=$PATH:/home/void/Programs/dwm-bar/




