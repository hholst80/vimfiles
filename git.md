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
	ls = log --oneline
	exec = "! "
	root = rev-parse --show-toplevel
	fap = fetch --all --prune
	spop = stash pop
	sls = stash list
```

# Authentication cache

Windows [git:wincred]:

    git config --global credential.helper wincred

GNU/Linux [git:credential]

    git config --global credential.helper cache

[git:wincred]: https://help.github.com/articles/caching-your-github-password-in-git/
[git:credential]: https://git-scm.com/docs/git-credential-cache

# Use git as a diff tool

## Use Vim as a merge tool

    git config --global merge.tool vimdiff
    git config --global merge.conflictstyle diff3
    git config --global mergetool.prompt false
    git mergetool

http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/

## Use vimdiff as a difftool

    git config --global diff.tool gvimdiff

