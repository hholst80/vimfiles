# Broadcast ping on LAN adress `192.168.0.0/24`:

~~~~
FOR /L %i in (1,1,254) do @ping -n 1 192.168.0.%i | findstr "bytes="
~~~~

~~~~
for i in `seq 1 254`; do ( ping -c1 192.168.0.$i >& /dev/null && echo 192.168.0.$i & ) ; done
~~~~
