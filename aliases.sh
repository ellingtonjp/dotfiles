alias be='bundle exec'

alias szrc='source ~/.zshrc'
alias sbrc='source ~/.bashrc'
alias vali='vim ~/.aliases'
alias vvrc='vim ~/.vimrc'
alias vzrc='vim ~/.zshrc'

ls='ls'
if [ "$(hostname)" = "jonathan-ellington-mbp" ]; then
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

if [ "$(hostname)" = "jonathan-ellington-mbp" ]; then
  alias cdm='cd ~/meraki'
  alias cdbs='cd ~/meraki/broadsoft'
fi

if [[ "$(hostname)" = *".meraki.com"* ]]; then
  # Pushing/pulling gerrit
  alias gpull='git pull --rebase origin master'
  alias gpush='git push origin HEAD:refs/for/master'
fi

if [ "$(hostname)" = "sf111.meraki.com" ]; then
  # moving around
  alias cda='cd /archive/jellingt'
  alias cdad='cd /archive/dialer'

  alias cdci="cd /archive/jellingt/co/router/scripts/ci"
  alias cdlocks="cd /var/local/meraki/mctester"

  alias tb='cd /archive/jellingt/co/router/testbed/testbed_mc'
  alias tbs='cd /archive/jellingt/co/router/testbed/testbed_mc/scripts'
  alias tbe='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e'
  alias tbel='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e/lib'
  alias tbec='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e/config'
  alias tbet='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e/tests'
  alias tbeg='cd /archive/jellingt/co/router/testbed/testbed_mc/e2e/logs'
  alias tbl='cd /archive/jellingt/co/router/testbed/testbed_shared/lib'
  alias tbdl='cd /archive/jellingt//co/router/testbed/testbed_shared/lib/dashboard'

  alias iphones='bundle exec pry -I /archive/jellingt/co/router/testbed/testbed_mc/scripts -r "interactive_phones.rb"'

  # Jenkins
  alias jsu='sudo su jenkins'
  alias jws='cd /var/local/meraki/jenkins_slave/workspace/phone/'

  # Rubocop
  alias brc='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml"'
  alias brcf='be rubocop -c "/archive/jellingt/co/router/testbed/.rubocop.yml" --auto-correct'

  # McTester
  alias testmin='be rake e2e:test:minimal mode=dev'
  alias rmvling='tb ; be rake utilities:remove_lingering'
  alias rmports='ls | grep -P "^[0-9]{4}$" | sudo xargs rm'
  alias psadb='ps aux | grep adb'

  # testbed
  alias dbbtp='psql -h 172.29.3.65 -U meraki -d testbednew'
  alias dbbtd='psql -h 172.29.3.65 -U meraki -d meraki_testbed_devel'

  # misc
  alias java6='/home/jellingt/.local/bin/jdk1.6.0_45/bin'
fi

if [ "$(hostname)" = "sf104.meraki.com" ]; then
  alias cdfw="cd /home/jellingt/android/watchtower"
  alias cddn="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/"
  alias cdcf="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/src/com/meraki/droidnode/scheduler/tasks"
  alias cdmc="cd /home/jellingt/android/watchtower/android-j/packages/apps/DroidNode/libs/libmeraki/src/main/java/com/meraki/libmeraki/config"
fi

function _git_rebase_other_branch() {
  curr_branch=$(git rev-parse --abbrev-ref HEAD)
  git checkout $1
  git pull --rebase origin master
  git checkout $curr_branch
}

alias grbo=_git_rebase_other_branch

# SSH
for h in sf111 dev122 sf104; do
  alias $h="ssh $h"
done
