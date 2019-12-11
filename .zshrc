[ -s "$HOME/.pre.zsh" ] && source "$HOME/.pre.zsh"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export FZF_CTRL_T_OPTS="--ansi --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 1> /dev/null | head -200'"
export FZF_DEFAULT_COMMAND='fd --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

setopt shwordsplit

ZSH_THEME="knowles"

HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=1
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git docker docker-compose tmuxinator tmux ansible-server fzf scm_breeze zsh-autosuggestions history-substring-search last-working-dir z cargo aws extract gpg-agent)

source $ZSH/oh-my-zsh.sh
export TERM='xterm-256color'

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GPG_TTY=$(tty)
export SDKMAN_DIR="$HOME/.sdkman"

setopt HIST_IGNORE_ALL_DUPS
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit

[ -s "/usr/local/bin/nvim" ] && export EDITOR="/usr/local/bin/nvim"
[ -s "/usr/bin/nvim" ] && export EDITOR="/usr/bin/nvim"

export SHELL="/bin/zsh"
setopt no_complete_aliases

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^[^P' history-substring-search-up
bindkey '^[^N' history-substring-search-down
bindkey '^ ' autosuggest-accept

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"

[ -s "$HOME/configs/tmuxinator.zsh" ]                                                        && source "$HOME/configs/tmuxinator.zsh"
[ -s "$HOME/.fzf.zsh" ]                                                                      && source "$HOME/.fzf.zsh"
[ -s "$HOME/.iterm2_shell_integration.zsh" ]                                                 && source "$HOME/.iterm2_shell_integration.zsh"
[ -s "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]                                                     && source "$HOME/.scm_breeze/scm_breeze.sh"
[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]                                                      && source "$SDKMAN_DIR/bin/sdkman-init.sh"

[ -s "$HOME/.rubies/ruby-2.6.5/bin/" ]                                                       && export PATH="$HOME/.rubies/ruby-2.6.5/bin/":$PATH
[ -s "$HOME/.cargo/bin" ]                                                                    && export PATH="$HOME/.cargo/bin":$PATH
[ -s "/usr/local/go/bin" ]                                                                   && export PATH="$HOME/usr/local/go/bin":$PATH
[ -s "$HOME/.gem/ruby/2.6.0/bin" ]                                                           && export PATH="$HOME/.gem/ruby/2.6.0/bin":$PATH
[ -s "/usr/local/opt/ruby/bin/" ]                                                            && export PATH="/usr/local/opt/ruby/bin":$PATH

alias vi=nvim
alias vim=nvim
alias l="lsd -A1tl"

fortune | cowsay | lolcat

[ -s "$HOME/.post.zsh" ] && source "$HOME/.post.zsh"
