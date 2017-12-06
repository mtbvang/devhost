#!/bin/bash

echo "Running initialise.sh"
PROXY=$1
NO_PROXY=$2


echo "
alias gq='./gradlew -q'
alias g='./gradlew'
alias v='./gradlew'
alias gqba='pon && gq vagrantup && gq openshiftup && gq openshiftportforwardall && pof'

pon() {
  export http_proxy=http://$PROXY
  export https_proxy=https://$PROXY
  export HTTP_PROXY=http://$PROXY
  export HTTPS_PROXY=https://$PROXY
  export no_proxy=$NO_PROXY
  export NO_PROXY=$NO_PROXY
  git config --global http.proxy $PROXY
  git config --global https.proxy $PROXY
  echo ---\> proxy on
}

pof() {
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset NO_PROXY
  unset no_proxy
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  echo ---\> proxy off
}" > ~/.bash_profile

echo "Finished initialise.sh: pon() and pof() commands added to your bash profile. The next time you start a bash shell they will be available."