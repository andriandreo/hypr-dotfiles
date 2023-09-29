#eval "$(starship init zsh)"

#export SSH_AUTH_SOCK=/run/user/1000/ssh-agent.socket

# Set up 'silent output'
silent_background() {
  setopt LOCAL_OPTIONS NO_NOTIFY NO_MONITOR
  "$@" &
} 

# Autostart odrive/BoxSync agent
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then  
  nohup "$HOME/.odrive-agent/bin/odriveagent" > /dev/null 2>&1 &
fi
alias odrive="$HOME/.odrive-agent/bin/odrive"

# Automatically start sway

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=Hyprland
  export NO_AT_BRIDGE=1
  export MOZ_ENABLE_WAYLAND=true # Use =1 or =true to support wayland or xwayland Window Protocol, respectively
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_QPA_PLATFORMTHEME=qt5ct
  export QT_FONT_DPI=96
  #export GTK_USE_PORTAL=1
  #export GDK_DEBUG=portals # New command for the above (?)
  # eval $(gnome-keyring-daemon --start) # Uncomment only if anytype is used
  # export SSH_AUTH_SOCK
  export MOZ_DBUS_REMOTE=1 # Use DBUS remote exclusively, i.e. allow to X11 and Wayland Firefox instances to run together (may be needed when opening web links from other applications to e.g. Firefox)
  exec Hyprland
fi

# Fetch & lolcat
neofetch | lolcat

# Simulate xterm via ssh
alias ssh="TERM=xterm-256color ssh"

# zsh plugins & dev
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-wakatime/zsh-wakatime.plugin.zsh
source silent_background /opt/esp-idf/export.sh

# Paru: Pacman Helper
alias yay="paru"

# Server SSH shortcut
# alias server="ssh server.lan"

# exa: A modern replacement for ls
alias ls="exa"
alias lt="exa --tree"
alias la="exa -la"

# bat: a cat clone with wings
alias cat="bat"

# rsync: Not cp anymore
alias cp="rsync -a --info=progress2"

eval "$(atuin init zsh)"

# Created by `pipx` on 2023-09-21 11:08:18
export PATH="$PATH:/home/andriandreo/.local/bin"
