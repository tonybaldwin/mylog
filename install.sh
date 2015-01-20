#!/bin/bash

# installer for mylog.sh
# by tony baldwin - http://tonybaldwin.me

echo "installing mylog.sh ... "

if [ ! i-d  "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi
if [ ! -d "$HOME/.mylog" ]; then
	mkdir $HOME/.mylog
fi

cp mylog $HOME/bin/mylog
chmod +x $HOME/bin/mylog

echo "Creating config files ... "
read -p "What is your prefered editor? (default is vim) " ed
if [[ $ed != "" ]]; then
	editor=$ed
else
	editor="/usr/bin/vim"
fi
echo "# mylog.sh config file" > $HOME/.mylog.conf
echo "mylogdir=$HOME/.mylog/" >> $HOME/.mylog.conf
echo "editor=$editor" >> $HOME/.mylog.conf

read -p "Will you use the redmatrix posting feature? (y/n)" rplug
if [ $rplug = y ]; then 
read -p "RedMatrix username: " $ruser
read -p "RedMatrix password: " $rpass
read -p "RedMatrix site (include https://yourredmatrixsite.tld): " $rurl
echo "rplug=y" >> $HOME/.mylog.conf
echo "ruser=$ruser" >> $HOME/.mylog.conf
echo "rpass=$rpass" >> $HOME/.mylog.conf
echo "rurl=$rurl" >> $HOME/.mylog.conf
else
	echo "rplug=nope" >> $HOME/.runlog.conf
fi


echo "Installation complete."

mylog h

exit
