# where do you want to store your plugins?
ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

# get zsh_unplugged and store it with your other plugins
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi
source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# make list of the Zsh plugins you use
repos=(
  # plugins that you want loaded first
  spaceship-prompt/spaceship-prompt

  # other plugins
  zsh-users/zsh-completions
  agkozak/zsh-z
  fdellwing/zsh-bat
  TwoPizza9621536/zsh-exa
  Junker/zsh-archlinux
  # ...

  # plugins you want loaded last
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)

function plugup {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

# now load your plugins
plugin-load $repos
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down
autoload -U compinit; compinit
