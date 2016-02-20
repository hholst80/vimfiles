# Broadcast ping on LAN adress `192.168.0.0/24`:

`cmd.exe`
~~~~
FOR /L %i in (1,1,254) DO @(ping -n 1 192.168.0.%i | findstr bytes=32 > NUL && echo 192.168.0.%i)
~~~~

`bash`
~~~~
for i in `seq 1 254`; do ( ping -c1 192.168.0.$i >& /dev/null && echo 192.168.0.$i ) ; done
~~~~

`bash` parallel
~~~~
for i in `seq 1 254`; do ( ping -c1 192.168.0.$i >& /dev/null && echo 192.168.0.$i & ) ; done
~~~~
