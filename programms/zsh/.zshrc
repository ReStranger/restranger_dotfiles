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

ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
zvm_after_init_commands+=("bindkey '^[[A' up-line-or-beginning-search" "bindkey '^[[B' down-line-or-beginning-search")

autoload -Uz compinit && compinit -d "$HOME/.cache/zcompdump-${ZSH_VERSION}"

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
  exec bash /home/restranger/.config/hypr/scripts/nvidia_fix
fi

if [[ -d "$HOME/.local/bin/platform-tools/" ]] ; then
    PATH="$HOME/.local/bin/platform-tools/:$PATH"
fi

alias neofetch="~/.config/neofetch/random_img.sh"
alias shell-color-scripts="~/.config/scripts/shell-color-scripts/random_script.sh"
alias vi="nvim"
alias lg="lazygit"
alias ls="lsd --color=auto"
alias la="lsd --color=auto -a"
alias lt="lsd --color=auto --tree"
alias rr="ranger"
alias tmux="tmux -u"
alias uwufetch="uwufetch -i"
alias mkvenv="python -m venv .venv"

alias :q="exit"
alias Жй="exit"
alias :Q="exit"
alias ЖЙ="exit"

alias find.trash="sudo find / | grep -vE '/home/restranger/.cache|/home/restranger/.icons|/root/.cache|/root/.icons|/var/log|/tmp' | grep"
alias ssh.kali="ssh 192.168.122.187 -l restranger"
alias ssh.open="sudo systemctl start zerotier-one.service && sudo systemctl start sshd.service"
alias gentoo-chroot="~/.config/scripts/GentooChroot"
alias random_wallpaper="~/.config/scripts/WallColorParser/random_wallpaper"

export PATH=$PATH:/home/restranger/.spicetify

eval "$(fzf --zsh)"
eval "$(starship init zsh)"
