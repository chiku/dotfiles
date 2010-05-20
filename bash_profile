export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.5/Home

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -d ~/bin ]; then
    PATH=$PATH:~/bin
    export PATH
fi

PATH=$PATH:/usr/local/mysql/bin
export PATH

export PS1="\w\$ "
export PS2="(You may have missed a quotation or a parenthesis)!! "
export LC_ALL="en_US"
export EDITOR="nano"
export HISTSIZE=1000000

# open a new tab on Terminal with the current working dir
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
  path_sans_last_name=`dirname $1`
  first_name=`basename $path_sans_last_name`
  last_name=`basename $1`
  if [ ${last_name} == "trunk" ]; then
    echo "${first_name}/${last_name}"
  else
    echo "${last_name}"
  fi
}

# set default prompt
dp() {
  export PROMPT_COMMAND='echo -ne "\033]0;`last2dirs ${PWD}`\007"'
}

# change the default title on terminal
p() {
  prmpt=$1
  export PROMPT_COMMAND='echo -ne "\033]0;${prmpt}\007"'
}

dp

svn_up() {
  svn cleanup
  svn up
  rake db:migrate
  rake db:migrate RAILS_ENV=test_integration
}

git_up() {
  git pull
  giternal update
  rake db:migrate
  rake db:migrate RAILS_ENV=test_integration
}

source ~/.bash_aliases

if [[ -s /Users/chiranm/.rvm/scripts/rvm ]] ; then source /Users/chiranm/.rvm/scripts/rvm ; fi
