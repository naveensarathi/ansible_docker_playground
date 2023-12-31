echo "1) Installing Servers"
docker run -it -d mmumshad/ubuntu-ssh-enabled ;docker run -it -d mmumshad/ubuntu-ssh-enabled ;docker run -it -d mmumshad/ubuntu-ssh-enabled 

echo "2) Installing Ansible"
pip install ansible 

echo "3) Creating inventory.txt" 
y=1
for x in `docker ps | awk '{print $1}' | grep -v CONTAINER` 
do
ip=`docker inspect $x | grep -i IPAddress | grep -v Sec| cut -f2 -d':' | uniq | tr "\"" ' ' | tr "," ' '| awk '{print $1}'`
echo "target$y ansible_host=$ip ansible_ssh_pass=Passw0rd ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> inventory.txt
y=`echo $y+1 | bc `
done
cat inventory.txt 

echo "4) Adding sshpass package"
apk add sshpass

echo "5) ping targets"

ansible target1 -m ping -i inventory.txt 
ansible target2 -m ping -i inventory.txt 
ansible target3 -m ping -i inventory.txt 


