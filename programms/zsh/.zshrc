ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit light Aloxaf/fzf-tab
zinit wait lucid for MichaelAquilina/zsh-autoswitch-virtualenv

zinit snippet OMZP::colorize
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::oc
zinit snippet OMZP::gnu-utils
zinit snippet OMZP::command-not-found

# ZSH VI MODE
export KEYTIMEOUT=1
ZVM_INIT_MODE=sourcing
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_NEX
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_VI_HIGHLIGHT_FOREGROUND=#BAC2DE
ZVM_VI_HIGHLIGHT_BACKGROUND=#2F2E3E

# Themes
export FZF_DEFAULT_OPTS=" \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export BAT_THEME="Catppuccin Mocha"

# ZSH Settings
autoload -Uz compinit && compinit -d "$HOME/.cache/zcompdump-${ZSH_VERSION}"

bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward
bindkey -M vicmd "k" history-beginning-search-backward
bindkey -M vicmd "j" history-beginning-search-forward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

zinit cdreplay -q

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'lsd --color=always $realpath'

if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
  exec bash /home/restranger/.config/hypr/scripts/nvidia_fix.sh
fi

if [[ -d "$HOME/.local/bin/platform-tools/" ]] ; then
    PATH="$HOME/.local/bin/platform-tools/:$PATH"
fi

if [[ -d "$HOME/.local/bin/" ]] ; then
    PATH="$HOME/.local/bin/:$PATH"
fi

# DISABLE IF U USE x11 or not use alacritty-smooth-cursor-git
if [[ -z "$WAYLAND_DISPLAY" && $TERM = "xterm-256color" || $TERM = "alacritty" ]]; then
    export WAYLAND_DISPLAY=wayland-1
fi

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
function rezsh_update() {
  if [[ -d "$HOME/.cache/re_zsh/" ]]; then
    rm -rf $HOME/.cache/re_zsh/
  fi
  mkdir -p "$HOME/.cache/re_zsh/"
  cd $HOME/.cache/re_zsh/
  git clone --no-checkout https://github.com/ReStranger/restanger_dotfiles.git $HOME/.cache/re_zsh
  git sparse-checkout init --cone 
  git sparse-checkout set programms/zsh/.zshrc
  git checkout main
  git pull
  cp -f $HOME/.cache/re_zsh/programms/zsh/.zshrc $HOME/.zshrc
  git sparse-checkout disable
  cd -
  rm -rf $HOME/.cache/re_zsh/
  zinit self-update
  zinit update -a -p 10
  clear
  echo "\nrezsh updated\n"

}

# REPLASES
alias vi="nvim"
alias lg="lazygit"
alias ls="lsd --color=auto"
alias la="lsd --color=auto -a"
alias ll="lsd --color=auto -la"
alias lt="lsd --color=auto --tree"
alias cat="bat --style=plain"
alias tmux="tmux -u"
alias uwufetch="uwufetch -i"
alias mkvenv="python -m venv .venv && source .venv/bin/activate"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias :q="exit"
alias Жй="exit"
alias :Q="exit"
alias ЖЙ="exit"

# USFULL COMMANDS
alias find.trash="sudo find / | grep -vE '/home/restranger/.cache|/home/restranger/.icons|/root/.cache|/root/.icons|/var/log|/tmp' | rg"
alias ssh.open="sudo systemctl start zerotier-one.service && sudo systemctl start sshd.service"

# SCRIPTS
alias gentoo-chroot="$HOME/.config/scripts/GentooChroot"
if [ $TERM = "xterm-kitty" ]; then 
  alias neofetch="$HOME/.config/neofetch/random_img.sh"
fi
alias shell-color-scripts="$HOME/.config/scripts/shell-color-scripts/random_script.sh"
alias rezsh_remove_folders="sudo rm -rf $HOME/.local/share/zinit/ && echo \"\nZSH folders removed\n\""
alias rezsh_reload_config="source $HOME/.zshrc"
alias zcr="source $HOME/.zshrc"

export PATH=$PATH:/home/restranger/.spicetify

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
