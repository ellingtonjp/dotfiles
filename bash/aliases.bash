# Source/edit bashrc
alias sbrc='source ~/.bashrc'
alias vrc='vim ~/.vimrc'

ls='ls'
if [ "$HOSTNAME" == "jonathan-ellington-mbp" ]; then
  ls='gls'
fi

# ls
alias ls="${ls} --color --group-directories-first"
alias l='ls -lA'
alias ll='ls -l'
alias la='ls -A'

# Grepping
alias gg='git grep'

# Moving around
alias cdf='cd ~/.files'

if [[ $HOSTNAME = *".meraki.com"* ]]; then
  # Pushing/pulling gerrit
  alias gpull='git pull --rebase origin master'
  alias gpush='git push origin HEAD:refs/for/master'
fi

if [ "$HOSTNAME" == "sf111.meraki.com" ]; then
  # moving around
  alias cda='cd /archive/jellingt'
  alias cdco='cd /archive/jellingt/co'
  alias tb='cd /archive/jellingt/co/router/testbed/testbed_mc'
  alias e2e='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e'
  alias tbs='cd /archive/jellingt/co/router/testbed/testbed_shared/lib'
  alias tbdl='cd /archive/jellingt//co/router/testbed/testbed_shared/lib/dashboard'
  alias cdci="cd /archive/jellingt/co/router/scripts/ci"
  alias cdlocks="cd /var/local/meraki/mctester"

  # Jenkins
  alias jsu='sudo su jenkins'
  alias jws='cd /var/local/meraki/jenkins_slave/workspace/phone/'

  # Rubocop
  alias brc='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml"'
  alias brcf='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml" --auto-correct'

  # McTester
  alias testmin='be rake e2e:test:minimal mode=dev'
  alias rmvling='tb ; be rake utilities:remove_lingering'
  alias rmports="ls | grep -P "^[0-9]{4}$" | sudo xargs rm"
  alias psadb='ps aux | grep adb'

  # testbed
  alias dbbtp='psql -h 172.29.3.65 -U meraki -d testbednew'
  alias dbbtd='psql -h 172.29.3.65 -U meraki -d meraki_testbed_devel'

  # misc
  alias java6='/home/jellingt/.local/bin/jdk1.6.0_45/bin'
fi

if [ "$HOSTNAME" == "sf104.meraki.com" ]; then
  alias cdfw="cd /home/jellingt/android/watchtower"
  alias cddn="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/"
  alias cdcf="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/scheduler/tasks"
  alias cdmc="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/libs/libmeraki/src/main/java/com/meraki/libmeraki/config"
fi

# SSH
for h in sf111 dev109 sf104; do
  alias $h="ssh $h"
done

