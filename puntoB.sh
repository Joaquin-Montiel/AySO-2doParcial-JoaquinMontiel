Modifico el inventory:
vim inventory
cat inventory
[desarrollo]
192.168.56.9

Modifico el playbook:
vim playbook
cat playbook.yml
 --
   - hosts: 
       - all
     tasks:
       - name: "Set WEB_SERVICE dependiendo de la distro"
         set_fact:
           WEB_SERVICE: "{% if   ansible_facts['os_family']  == 'Debian' %}apache2 
                         {% elif ansible_facts['os_family'] == 'RedHat'  %}httpd
                         {% endif %}"
   
       - name: "Muestro nombre del servicio:"
         debug:
           msg: "nombre: {{ WEB_SERVICE }}"
   
      - name: "Run the equivalent of 'apt update' as a separate step"
         become: yes
         ansible.builtin.apt:
           update_cache: yes
         when: ansible_facts['os_family'] == "Debian"
   
       - name: "Instalando apache " 
         become: yes
         package:
           name: "{{ item }}"
           state: present
         with_items:
           - "{{ WEB_SERVICE }}" 



Esto se ejecuta desde el Nodo, que esta vinculsdo con el host
vagrant@VMAmn316Parcial:~/UTN-FRA_SO_Ansible/ejemplo_02$ ansible-playbook -i inventory playbook.yml

PLAY [all] ***********************************************************************************

TASK [Gathering Facts] ***********************************************************************
ok: [192.168.56.9]

TASK [Set WEB_SERVICE dependiendo de la distro] **********************************************
ok: [192.168.56.9]

TASK [Muestro nombre del servicio:] **********************************************************
ok: [192.168.56.9] => {
    "msg": "nombre: apache2 "
}

TASK [Run the equivalent of 'apt update' as a separate step] *********************************
changed: [192.168.56.9]

TASK [Instalando apache] *********************************************************************
changed: [192.168.56.9] => (item=apache2 )

PLAY RECAP ***********************************************************************************
192.168.56.9               : ok=5    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0


Esto se ejecuta en el host para verificar que se haya instalado apache
vagrant@VMAnsDevParcial:~$ sudo apt list --installed |grep apache

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

apache2-bin/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.12 amd64 [installed,automatic]
apache2-data/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.12 all [installed,automatic]
apache2-utils/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.12 amd64 [installed,automatic]
apache2/jammy-updates,jammy-security,now 2.4.52-1ubuntu4.12 amd64 [installed]
vagrant@VMAnsDevParcial:~$

