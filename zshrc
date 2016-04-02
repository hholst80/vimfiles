get_file() {
	which curl >& /dev/null
	if [ $? -eq 0 ]; then
		curl -o $2 $1
		return
	fi
	which wget >& /dev/null
	if [ $? -eq 0 ]; then
		wget -o $2 $1
	fi
	exit 1
}
	
if [ ! -f ~/.antigen.zsh ]; then
	get_file "https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh" ~/.antigen.zsh
fi

source ~/.antigen.zsh

# Load the oh-my-zsh's library.
# ZSH_THEME=agnoster

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell
#antigen theme agnoster

# Tell antigen that you're done.
antigen apply

# http://superuser.com/questions/480928/is-there-any-command-like-time-but-for-memory-usage
TIMEFMT='%J   %U  user %S system %P cpu %*E total
avg shared (code):         %X KB
avg unshared (data/stack): %D KB
total (sum):               %K KB
max memory:                %M MB
page faults from disk:     %F
other page faults:         %R'
