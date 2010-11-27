# .profile doesn't kick in if .bash_profile is present. Force load it
source ~/.profile

export PS1="\[$text_green\]\w \[$text_purple\]\$(parse_git_branch)\[$text_red\] <\$(rvm_version)>\[$text_reset\] \$ "
export PS2="(You may have missed a quotation or a parenthesis)!! "

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi
