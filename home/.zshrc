# alias_path
alias -g ...='../../'
alias -g ....='../../../'
alias -g .....='../../../../'

# alias_command
alias -g G='|grep'
alias -g L='|less'
# alias -g L='|wc -l' 
alias M='man'
alias -g H='--help'
alias N="nvim"
alias -g P='|xsel --clipboard --input'

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias pbcopy='xsel --clipboard --input'
alias dk='docker'
alias ldk='lazydocker'
alias lg='lazygit'
alias dirs='dirs -v'

# Directory Hash
# 以下のように設定するとcd ~apiのようにしてディレクトリのエイリアスを作成できる。
# hash -d api=/tmp/src/main/java/api

# auto_cd
setopt auto_cd

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=10000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# smart-insert-last-word
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey  '^[' insert-last-word

# Ctrl + s (出力の一時停止）/ Ctrl + q (出力の再開）無効化
stty -ixon

# Push line
bindkey '^S' push-line

# fzf 2025-06-02
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey -r '^T'
bindkey '^Q' fzf-file-widget

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# edit-command-line
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^v' edit-command-line

# zsh compleation (homebrew)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# alias N="nvim" 可読性のためエイリアスの箇所（このファイルの上部）に移動する。
# Prompt 2025-05-27
PROMPT="%~@%m_%n$ "

# bun completions
[ -s "/home/sato/.bun/_bun" ] && source "/home/sato/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# tmux setting 2025-06-02
alias t="tmux"
alias tls="tmux ls"

# tmux autocmd 2025-06-04
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi
