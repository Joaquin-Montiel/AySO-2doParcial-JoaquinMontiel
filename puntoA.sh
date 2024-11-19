sudo fdisk /dev/sdc =>para particionar el disco y asignar sistema swap a sdc1(código 82) y asignar sistema lvm a sdc2, sdc3, sdc5, sdc6(codigo 8E). 

sudo vgcreate vgAdmin /dev/sdc2 /dev/sdc3
sudo vgcreate vgDevelopers /dev/sdc5 /dev/sdc6

sudo lvcreate -L 1.99G -n lvAdmin vgAdmin

sudo lvcreate -L 1G -n lvDevelopers vgDevelopers
sudo lvcreate -L 1G -n lvTesters vgDevelopers
sudo lvcreate -L 1016.00m -n lvDevops vgDevelopers

formateo:
sudo mkfs.ext4 /dev/mapper/vgAdmin-lvAdmin
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevelopers
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvTesters
sudo mkfs.ext4 /dev/mapper/vgDevelopers-lvDevop

creo directorio para montar:
sudo mkdir /mnt/lvAdmin
sudo mkdir /mnt/lvDevelopers
sudo mkdir /mnt/lvTesters
sudo mkdir /mnt/lvDevops

monto:
sudo mount /dev/vgAdmin/lvAdmin /mnt/lvAdmin
sudo mount /dev/mapper/vgDevelopers-lvDevelopers /mnt/lvDevelopers
sudo mount /dev/mapper/vgDevelopers-lvTesters /mnt/lvTesters
sudo mount /dev/mapper/vgDevelopers-lvDevops /mnt/lvDevops

vagrant@vm2doParcial:~$ df -h
Filesystem                             Size  Used Avail Use% Mounted on
tmpfs                                  197M  1.1M  196M   1% /run
/dev/sda1                               39G  1.5G   38G   4% /
tmpfs                                  982M     0  982M   0% /dev/shm
tmpfs                                  5.0M     0  5.0M   0% /run/lock
home_vagrant_foo                       237G  184G   54G  78% /home/vagrant/foo
tmpfs                                  197M  4.0K  197M   1% /run/user/1000
/dev/mapper/vgAdmin-lvAdmin            2.0G   24K  1.9G   1% /mnt/lvAdmin
/dev/mapper/vgDevelopers-lvDevelopers  974M   24K  907M   1% /mnt/lvDevelopers
/dev/mapper/vgDevelopers-lvTesters     974M   24K  907M   1% /mnt/lvTesters
/dev/mapper/vgDevelopers-lvDevops      982M   24K  915M   1% /mnt/lvDevops

