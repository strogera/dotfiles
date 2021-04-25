# Lines configured by zsh-newuser-install
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[blue]%}%n%{$fg[white]%}@%{$fg[green]%}%M %{$fg[cyan]%}%~%{$fg[red]%}]%{$fg[yellow]%}$%b "

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1"  ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh"  ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -Uz compinit
compinit
zstyle :compinstall filename '/home/milluki/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd  ]] ||
		[[ $1 = 'block'  ]]; then
			echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main  ]] ||
		[[ ${KEYMAP} == viins  ]] ||
		[[ ${KEYMAP} = ''  ]] ||
		[[ $1 = 'beam'  ]]; then
			echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	 echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

alias youtube-full-worst-download="youtube-dl --write-description --write-thumbnail -o '~/Downloads/%(title)s by %(uploader)s on %(upload_date)s/%(title)s.%(ext)s' -f worstvideo+worstaudio " 
alias youtube-full-best-download="youtube-dl --write-description --write-thumbnail -o '~/Downloads/%(title)s by %(uploader)s on %(upload_date)s/%(title)s.%(ext)s' " 
alias stream-best= 'mpv'
alias stream-worst='mpv --ytdl-format=worst'
alias restart='sudo shutdown -r now'
alias turnoff='sudo shutdown -P now'
alias pdf='zathura'
alias ls='ls -ahF' 
alias rm='rm -I'
alias vi='vim'
alias pinstall='sudo pacman -Sy'
alias Logout='sudo pkill -u $USER'
alias usb='cd /run/media/$USER'
alias usbunmount='udiskie-umount /run/media/$USER/*'
alias usbremount='udiskie-mount -a'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
