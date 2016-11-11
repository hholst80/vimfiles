Install Go

    sudo apt install golang-go

Setup Bash

    export GOPATH="$HOME/go"
    export PATH="$GOPATH/bin:$PATH"
    if [ ! -d "$GOPATH" ]; then mkdir -p "$GOPATH"; fi

Install The Platinum Searcher

    go get -u github.com/monochromegane/the_platinum_searcher/...
