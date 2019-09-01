#!/bin/bash
#add fix to exercise6-fix here
dest=${!#}
num_of_files=$(($#-1))
bytes=0
if [ "$HOSTNAME" = "server2" ]
	then
                host_name="server1"
fi
if [ "$HOSTNAME" = "server1" ]
        then
                host_name="server2"
fi
for i in `seq 1 $num_of_files`;
        do
                sshpass -p "vagrant" scp ${!i} vagrant@$host_name:$dest
                bytes=$((bytes + $(stat -c%s "${!i}")))
        done
echo $bytes
