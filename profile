PATH=/usr/local/bin/:/usr/local/sbin:/usr/local/mysql/bin:$PATH
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

source ~/.aliases

if [[ -s /Users/chiranm/.rvm/scripts/rvm ]] ; then source /Users/chiranm/.rvm/scripts/rvm ; fi

export LC_ALL="en_US"
export EDITOR="nano"
export HISTSIZE=1000000

export USE_INDIA_REPO=true

dp
