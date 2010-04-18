alias ls='ls -G'

alias ff_cache="cd /Users/chiranm/Library/Caches/Firefox/Profiles/pnjbb7m3.default/Cache/; open ."

alias ss="NODEPS=true script/server"
alias sc="NODEPS=true script/console"
alias sd="script/dev"
alias mc="script/dbconsole"

alias staging="ssh rackspace"
alias rockspace="ssh rack_local"
alias build1="ssh rails@build1-prod.dcx.rackspace.com"
alias ep="mate ~/.bash_profile && source ~/.bash_profile"

alias mig="rake db:migrate && rake db:migrate RAILS_ENV=test_integration && rake db:migrate RAILS_ENV=test"
alias pcd="rake pcd"
alias rcov="rake rcov"
alias pci="rake pci"
alias mvim="/Applications/MacPorts/MacVim.app/Contents/MacOS/MacVim"

alias nt=newtab
