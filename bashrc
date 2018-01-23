export PS1="\[\e[93m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[m\]\w\[\e[m\]\[\e[32m\]\n$\[\e[m\] "
export PATH="/usr/local/opt/swig@2/bin:$PATH" # PJSip
export ANDROID_NDK_ROOT=/Users/jonathane/dev/lib/android-ndk-r10e # Android (Dialer)
export PATH="/archive/jellingt/bin/:/archive/jellingt/jdk1.6.0_45/bin:/home/jellingt/.gem/ruby/2.2.4/bin:$PATH" # DroidNode
export DROIDNODEPATH="/archive/jellingt/phone_firmware/android-j/out/target/product/capri_me1/system/app/DroidNode.apk" # DroidNode

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

source ~/.bash_aliases
