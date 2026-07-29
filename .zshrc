
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

fastfetch -c ~/.config/fastfetch/config.jsonc

eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"


alias ls='eza --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias lla='eza -la --icons --group-directories-first'

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"


alias update-all='sudo dnf upgrade --refresh -y && sudo dnf autoremove -y && flatpak update -y && flatpak uninstall --unused -y'
