#  .profile doesn't kick in if .bash_profile is present. Force load it
source ~/.profile

export PS1="\w\$ "
export PS2="(You may have missed a quotation or a parenthesis)!! "

if [ -f /usr/local/etc/bash_completion ]
then
  . /usr/local/etc/bash_completion
fi
