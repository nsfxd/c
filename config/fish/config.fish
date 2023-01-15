eval (ssh-agent -c) > /dev/null 2>&1
ssh-add $HOME/.ssh/id_ed25519 > /dev/null 2>&1
set fish_greeting

set -gx EDITOR nvim
set -gx NNN_TRASH 1
set -gx MOZ_ENABLE_WAYLAND 1

set -gx FZF_DEFAULT_OPTS '
--layout=reverse
--color=bg+:0,pointer:2,fg+:2,hl:5,hl+:5,info:3
'

abbr -ag S "sudo pacman -Syu"
abbr -ag Rs "sudo pacman -Rs"
abbr -ag Ss "pacman -Ss"
alias n "nnn -H -o -A"
alias rm "echo Use 'trash', or the full path i.e. '/bin/rm'"
alias Sq "pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias Rq "pacman -Qqe | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rs"
alias pRq "pacman -Qqm | fzf --multi --preview 'paru -Qi {1}' | xargs -ro sudo paru -Rs"

abbr sr "source $HOME/.config/fish/config.fish"

##kubectl
abbr -ag k "kubectl"
abbr -ag ka "kubectl apply -f"

set -gx NNN_TRASH 1
set -gx NNN_FCOLORS "0404040000000600010F0F02"

set -gx PATH $PATH $HOME/.local/bin 
set -gx PATH $PATH $HOME/.cargo/bin
set -gx PATH $PATH $HOME/go/bin

function md
  mkdir -p $argv
  cd $argv
end

function nv
  set result (find -type f -print 2>/dev/null | fzf)
  if test -n "$result"
    nvim $result
  end
end

function fd
  set result (find -mindepth 1 -type d -print 2>/dev/null | fzf)
  if test -n "$result"
    cd $result
  end
end

# pnpm
set -gx PNPM_HOME $HOME/.local/share/pnpm
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end


