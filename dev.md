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

# VMware

## Debian testing

Installing VMware Tools for Linux Guests

https://communities.vmware.com/thread/509898?start=0

~~~
root@debian:~/vmware-tools-patches/vmware-tools-distrib# ./vmware-install.pl 
open-vm-tools are available from the OS vendor and VMware recommends using 
open-vm-tools. See http://kb.vmware.com/kb/2073803 for more information.
Do you still want to proceed with this legacy installer? [yes] no
~~~
