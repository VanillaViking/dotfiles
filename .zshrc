# Created by newuser for 5.9
# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.config/zsh/history

# # Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# # Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
bindkey '^R' history-incremental-search-backward

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
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

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# # Load aliases and shortcuts if existent.
# [ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
# [ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

alias ls="ls --color"
alias z="nohup zathura > /dev/null"
alias sus="sudo systemctl suspend"
alias sb="source ~/.zshrc"
alias u="yay -Syu"
alias m="ncmpcpp"
alias mnt="sudo mount -o uid=vanilla,gid=wheel /dev/sda1 /mnt/hdd"
alias lwc='_lwc() { detex "$1" | wc -w ;}; _lwc'
alias fp='_fpush() { tailscale file cp $1 samsung-sm-s918b: ;}; _fpush'
alias mp='_mpush() { cp audio.mp3 $1 ; tailscale file cp $1 samsung-sm-s918b: ; rm $1}; _mpush'


alias e="neovide"
alias d="git checkout develop"
alias pl="git pull"
alias p="~/.scripts/push.sh"
alias c='_commit() { git commit -m "$1" ;}; _commit'
alias b='_branch() { git branch ashwin/"$1" && git checkout ashwin/"$1" ;}; _branch'
alias s="git status"
alias i="make init-storefront"
alias back="git checkout -"

alias piremote="kitten ssh pi@61.68.189.163"
alias pilocal="kitten ssh pi@192.168.1.100"

# USEFUL DIRS
alias obs="cd ~/Documents/vault/"
alias zyen="cd ~/projects/Zyenyo/"

alias zlogs='tail -F ~/projects/Zyenyo/logs/$(ls -Art ~/projects/Zyenyo/logs/ | tail -n 1)'

#alias clean-apis='cd ~/gecko/gecko-development-platform/gecko-backend && sudo rm -rf yalc.lock && sudo rm -rf .yalc'
#alias api='_plugin() { cd ~/gecko/gecko-development-platform/api-plugins/gecko-api-plugin-"$1" ;}; _plugin'
#alias backend="cd ~/gecko/gecko-development-platform/gecko-backend"
#alias g="cd ~/gecko/gecko-development-platform"
#alias admin="cd ~/gecko/gecko-development-platform/gecko-admin"
#alias pull-apis="~/.scripts/pull-script.sh"
#alias link="~/link.sh"
#alias logs="docker logs --follow gecko-backend-api-1"
#alias sflogs="docker logs --follow gecko-storefront-web-1"
#alias alogs="docker logs --follow gecko-admin-reaction-admin-1"
# alias matlock="sudo chmod o+w /run/lock"
# source /usr/share/nvm/init-nvm.sh

export EDITOR=nvim

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk

export BOT_DIR=~/projects/Zyenyo

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


export PATH=/home/vanilla/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/home/vanilla/.dotnet/tools:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:/home/vanilla/Android/Sdk/emulator:/home/vanilla/Android/Sdk/platform-tools:/home/vanilla/Android/Sdk/emulator:/home/vanilla/Android/Sdk/platform-tools

if [ -e /home/vanilla/.nix-profile/etc/profile.d/nix.sh ]; then . /home/vanilla/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
