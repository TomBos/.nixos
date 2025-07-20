# == PC state commands ==
alias reboot='systemctl reboot'
alias shutdown='systemctl poweroff'
alias uefi='systemctl reboot --firmware-setup'

# == Helpfull Shortcuts ==
alias ll='ls -lah'
alias reload='clear && source $BASHRC'
alias ducks='sudo du -ahxd1 | sort -hr | head -n 11'
alias mv='mv -i'
alias icat='kitten icat'
alias copy='xclip -selection clipboard'

# == Typos ==
alias chomd='chmod'
alias gut='git'
alias cd..='cd ..'

# == Disown App And Start It From Terminal ==
alias filezilla='nohup filezilla > /dev/null 2>&1 &'
alias librewolf='nohup librewolf -P > /dev/null 2>&1 &'

