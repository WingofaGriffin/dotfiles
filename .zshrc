ZPLUGINDIR=~/.zsh/plugins

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged2.zsh

repos=(
  # plugins that you want loaded first
  spaceship-prompt/spaceship-prompt

  # other plugins
  zsh-users/zsh-completions
  agkozak/zsh-z
  TwoPizza9621536/zsh-exa

  # plugins you want loaded last
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)

plugin-load $repos

# Aliases
alias rmorphans='sudo paru -Rs $(paru -Qtdq)'
alias parucache='paru -Sc'
alias zplug='plugin-update'

# Substring Hotkeys
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

autoload -U compinit; compinit
