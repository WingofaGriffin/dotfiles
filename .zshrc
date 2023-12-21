ZPLUGINDIR=~/.zsh/plugins

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/antidote.lite.zsh

repos=(
  # plugins that you want loaded first
  spaceship-prompt/spaceship-prompt

  # other plugins
  zsh-users/zsh-completions
  agkozak/zsh-z
  TwoPizza9621536/zsh-eza

  # plugins you want loaded last
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)
plugin-clone $repos
plugin-load $repos

# Aliases
alias rmorphans='yay -Rs $(yay -Qtdq)'
alias zplug='plugin-update'
alias reflector='reflector --save /etc/pacman.d/mirrorlist --protocol https --sort rate --latest 200'

# Substring Hotkeys
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

autoload -U compinit; compinit
