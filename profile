PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home

if [ -d ~/bin ]
then
  PATH=$PATH:~/bin
  export PATH
fi

# Open a new tab on Terminal with the current working dir
newtab() {
  osascript -e "
  tell application \"iTerm\"
   tell the current terminal
    launch session \"Default Session\"
    tell the last session
     write text \"cd $(pwd)\"
    end tell
   end tell
  end tell" > /dev/null 2>&1 /dev/null 2>&1
}

# The last two directory names
last2dirs() {
  path_sans_last_name=$(dirname $1)
  first_name=$(basename $path_sans_last_name)
  last_name=$(basename $1)
  if [ ${last_name} == "trunk" ]; then
    echo "${first_name}/${last_name}"
  else
    echo "${last_name}"
  fi
}

# Set default prompt
dp() {
  export PROMPT_COMMAND='echo -ne "\033]0;$(last2dirs ${PWD})\007"'
}

# Change the default title on terminal
p() {
  prmpt=$1
  export PROMPT_COMMAND='echo -ne "\033]0;${prmpt}\007"'
}

parse_git_branch() {
  local branch=`git describe --all 2>| /dev/null | sed -e 's/heads\/\(.*\)/\1/'`
  if [[ -n $branch ]]
  then
    echo "($branch)"
  fi
}

rvm_version() {
  echo $GEM_HOME | xargs basename
}

# hitch configuration

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

# Uncomment to persist pair info between terminal instances
# hitch

source ~/.aliases

export CC=gcc-4.2
export CXX=g++-4.2
export GCC=gcc-4.2

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/nvm/nvm.sh"       ]] && source "$HOME/nvm/nvm.sh"       # Load NVM into a shell session *as a function*

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR="vim"
export HISTSIZE=1000000

export NODE_PATH=/usr/local/lib/node
export GROOVEY_HOME=/usr/local/opt/groovy/libexec

export MAVEN_OPTS="-Xms2048m -Xmx4096m -XX:MaxPermSize=4096m -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"

dp
