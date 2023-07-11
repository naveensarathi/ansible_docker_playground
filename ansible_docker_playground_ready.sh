docker run -it -d mmumshad/ubuntu-ssh-enabled ;docker run -it -d mmumshad/ubuntu-ssh-enabled ;docker run -it -d mmumshad/ubuntu-ssh-enabled 
y=1
for x in `docker ps | awk '{print $1}' | grep -v CONTAINER` 
do
ip=`docker inspect $x | grep -i IPAddress | grep -v Sec| cut -f2 -d':' | uniq | tr "\"" ' ' | tr "," ' '| awk '{print $1}'`
echo "target$y ansible_host=$ip ansible_ssh_pass=Passw0rd" >> inventory.txt
y=`echo $y+1 | bc `
done
cat inventory.txt 
