#[ -n "$PS1" ] && source ~/.bash_profile
# Android Studio Tools
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH"
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# add go bin to path
export PATH="$HOME/iCloud/dev/go/bin:$PATH"
# add go app engine bin to path
export PATH="$HOME/go_appengine:$PATH"
# add Google Cloud SDK
export PATH=$HOME/google-cloud-sdk/bin:$PATH
# add $HOME/bin
export PATH=$HOME/bin:$PATH
# add elblox project
export PATH=/Users/tommy/Dropbox/dev/projects/axpo/elblox/bin:$PATH

# added by travis gem
[ -f /Users/tommy/.travis/travis.sh ] && source /Users/tommy/.travis/travis.sh

export PATH="$HOME/.rvm/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

cy() {
    ssh -t iphone4 "cycript -p $1"
}

# Charles Proxy
charles() {
    export ALL_PROXY=http://localhost:8888
    export HTTP_PROXY=$ALL_PROXY
    export HTTPS_PROXY=$ALL_PROXY
    export FTP_PROXY=$ALL_PROXY
    export RSYNC_PROXY=$ALL_PROXY
    export http_proxy=$ALL_PROXY
    export https_proxy=$ALL_PROXY
    export ftp_proxy=$ALL_PROXY
    export rsync_proxy=$ALL_PROXY
}
