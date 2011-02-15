# Path to your oh-my-zsh configuration.
export ZSH=$HOME/programs/oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="dallas"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

plugins=(git osx ruby rails brew)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
source ~/.profile
source ~/.aliases
