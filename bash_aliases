# Easy bashrc sourcing
alias sbrc='source ~/.bashrc'

# Colors
if [ "$OS" == "mac" ]; then
  color_flag="-G"
else
  color_flag="--color=auto"
fi
ls_default="--group-directories-first"
alias ls="ls $color_flag $ls_default"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls
alias l='ls -lA'
alias ll='ls -l'
alias la='ls -A'

# Moving around
alias cddf='cd ~/.files'
alias cda='cd /archive/jellingt'
alias cdco='cd /archive/jellingt/co'
alias tb='cd /archive/jellingt/co/router/testbed/testbed_mc'
alias tbs='cd /archive/jellingt/co/router/testbed/testbed_shared/lib'
alias tbdl='cd /archive/jellingt//co/router/testbed/testbed_shared/lib/dashboard'
alias cdfw="cd /archive/jellingt/phone_firmware/"
alias cddn="cd /archive/jellingt/phone_firmware/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/"
alias cdcf="cd /archive/jellingt/phone_firmware/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/scheduler/tasks"

# tmux
alias tm='tmux -CC'
alias tma='tmux -CC attach'

# Grepping
alias gg='git grep'

# Rubocop
alias brc='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml"'
alias brcf='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml" --auto-correct'

# Jenkins
alias jsu='sudo su jenkins'
alias jws='cd /var/local/meraki/jenkins_slave/workspace/phone/E2E-DashLib/'

# McTester
alias e2e='be rake -f rakefile_v2.rb'

# Vim
alias vrc='vim ~/.vimrc'
