set -o vi

export PS1="\[\e[93m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[m\]\w\[\e[m\]\[\e[32m\]\n$\[\e[m\] "
export PATH="/usr/local/opt/swig@2/bin:$PATH" # PJSip

export ANDROID_NDK_ROOT=/Users/jonathane/meraki/Dialer/lib/android-ndk-r10e # Android (Dialer)
export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT
export ANDROID_SDK_ROOT=/Users/jonathane/Library/Android/sdk
export PATH="/home/jellingt/.local/bin:~/.gem/ruby/2.2.9/bin:$PATH"
export JSBX="/var/local/meraki/jenkins_slave/workspace/phone/E2E-Nightly-FreeSwitch/tesbed"

export DROIDNODEPATH="/archive/jellingt/phone_firmware/android-j/out/target/product/capri_me1/system/app/DroidNode.apk" # DroidNode
export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45/bin

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     OS=linux;;
    Darwin*)    OS=mac;;
    CYGWIN*)    OS=cygwin;;
    MINGW*)     OS=minGw;;
    *)          OS="UNKNOWN:${unameOut}"
esac
export $OS

FILE=~/.bash_aliases && test -f $FILE && source $FILE
FILE=~/.less_colors && test -f $FILE && source $FILE

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
