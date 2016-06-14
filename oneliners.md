# Broadcast ping on LAN adress `192.168.0.0/24`:

`cmd.exe`

    FOR /L %i in (1,1,254) DO @(ping -n 1 192.168.0.%i | findstr bytes=32 > NUL && echo 192.168.0.%i)

`bash`

    for i in `seq 1 254`; do ( ping -c1 192.168.0.$i >& /dev/null && echo 192.168.0.$i ) ; done

`bash` parallel

    for i in `seq 1 254`; do ( ping -c1 192.168.0.$i >& /dev/null && echo 192.168.0.$i & ) ; done

# Remove first page in a pdf file

    pdftk input.pdf cat 2-end output output.pdf

# Debian testing

Installing VMware Tools for Linux Guests

https://communities.vmware.com/thread/509898?start=0

~~~
root@debian:~/vmware-tools-patches/vmware-tools-distrib# ./vmware-install.pl 
open-vm-tools are available from the OS vendor and VMware recommends using 
open-vm-tools. See http://kb.vmware.com/kb/2073803 for more information.
Do you still want to proceed with this legacy installer? [yes] no
~~~

# Reload `.tmux.conf`

    # type this in terminal
    $ tmux source-file ~/.tmux.conf
