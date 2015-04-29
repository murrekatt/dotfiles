#[ -n "$PS1" ] && source ~/.bash_profile
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# add go bin to path
export PATH="$HOME/go/bin:$PATH"
# add go app engine bin to path
export PATH="$HOME/go_appengine:$PATH"
# add $HOME/bin
export PATH=$HOME/bin:$PATH

# added by travis gem
[ -f /Users/tommy/.travis/travis.sh ] && source /Users/tommy/.travis/travis.sh

export PATH="$HOME/.rvm/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
