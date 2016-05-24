# Best (and safest) way to merge a git branch into master

    git checkout master
    git pull origin master
    git merge test
    git push origin master

# `.gitconfig` in `$HOME`

```
[user]
	name = Henrik Holst
[color]
	diff = auto
	status = auto
	branch = auto
[credential]
	helper = cache
[push]
	default = simple
[alias]
	co = checkout
	br = branch
	ci = commit
	st = status
	last = log -1 HEAD
	exec = "! "
	root = rev-parse --show-toplevel
```
