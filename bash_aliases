alias ls='ls -G'

alias ff_cache="cd /Users/chiranm/Library/Caches/Firefox/Profiles/pnjbb7m3.default/Cache/; open ."

alias ss="NODEPS=true script/server"
alias sc="NODEPS=true script/console"
alias sd="script/dev"
alias mc="script/dbconsole"

alias migrate_all="rake db:migrate && RAILS_ENV=test rake db:migrate && RAILS_ENV=test_integration rake db:migrate"
alias rollback_all="rake db:rollback && RAILS_ENV=test rake db:rollback && RAILS_ENV=test_integration rake db:rollback"
alias pc="rake pc"
alias rcov="rake rcov"
alias mvim="/Applications/MacPorts/MacVim.app/Contents/MacOS/MacVim"

alias nt=newtab

source ~/.bash_aliases_unpublished
