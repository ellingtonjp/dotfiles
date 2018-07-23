set -o vi

export PS1="\[\e[93m\]\u\[\e[m\]@\[\e[33m\]\h\[\e[m\]:\[\e[m\]\w\[\e[m\]\[\e[32m\]\n$\[\e[m\] "

if [ "$HOSTNAME" == "sf111.meraki.com" ]; then
  export PATH="/usr/local/opt/swig@2/bin:$PATH" # PJSip
  export PATH="/home/jellingt/.local/bin:$PATH"
  export PATH="/home/jellingt/gem/ruby/2.2.9/bin:$PATH"

  # Not sure what this is
  export JSBX="/var/local/meraki/jenkins_slave/workspace/phone/E2E-Nightly-FreeSwitch/tesbed"
fi

if [[ $HOSTNAME = "sf104.meraki.com" ]]; then
  # Used for firmware
  export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_45/bin
fi

if [[ $HOSTNAME = "jonathan-ellington-mbp" ]]; then
  # Dialer
  export ANDROID_NDK_ROOT=/Users/jonathane/meraki/Dialer/lib/android-ndk-r10e # Android (Dialer)
  export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT
  export ANDROID_SDK_ROOT=/Users/jonathane/Library/Android/sdk
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Sourcing
FILE=~/.bash_aliases && test -f $FILE && source $FILE

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
