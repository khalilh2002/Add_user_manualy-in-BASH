#!/bin/bash



if [ "$(id -u)" -eq 0 ]
then
	echo "you are root"
	
else
	echo "no,tu dois executer on 'root' ou 'sudo' "
	exit
fi



read -p"donner le nom de user : " nom_user ;echo
check=1
while [ $check -eq 1 ]
do
	read -p"donner le username : " username_ ;echo

	usercheck=$(grep "$username_" /etc/passwd)

	if [ -n "$usercheck" ] ;then
		echo "le nom deja exist";
	else
		check=0
	fi
done

#read -s -p "donner le password :" pswd ;echo

echo "hello $nom_user your username is $username_ and password is "

echo "test-------------------------------"

user_list=$(sudo grep -E '.*' /etc/shadow | cut -d: -f1)

#--------------------------------------------------
max=0
unset id_
for i in $user_list
do
	if [ "$i" != "nobody" ];then
		id_=$( id -u "$i")
		#echo "$i :$id_"
		if [ $id_ -ge $max ];then
			max=$id_
		fi
	fi
done
echo "------------------max-----------$max--------------"
id_user=$(($max + 1))
#echo "$id_user"
#sudo useradd -u "$id_user" -c "$nom_user" -m "$username_"


date_=$(date "+%Y-%m-%d")
date_=$(date -d "$date_" +%s)



 echo "$username_:x:$id_user:$id_user:$nom_user:/home/$username_:/bin/bash" >> /etc/passwd

 echo "$username_::$date_::::" >> /etc/shadow

 cp -r /etc/skel /home/$username_
sudo passwd "$username_"
echo "le compte a ete creer "
