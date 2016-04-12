# Git

## Use Vim as a merge tool

```
git config merge.tool vimdiff
git config merge.conflictstyle diff3
git config mergetool.prompt false
git mergetool
```

http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/

## Authentication cache

Windows [git:wincred]:

```
git config --global credential.helper wincred
```

GNU/Linux [git:credential]

```
git config --global credential.helper cache
```

[git:wincred]: https://help.github.com/articles/caching-your-github-password-in-git/
[git:credential]: https://git-scm.com/docs/git-credential-cache

# Vim

## Ignore whitespace in diff

```
set diffopt+=iwhite
```

## Paste yanked text in Vim command line

Hit `CTRL-R` and then `"`

http://stackoverflow.com/questions/3997078/how-to-paste-yanked-text-into-vim-command-line
