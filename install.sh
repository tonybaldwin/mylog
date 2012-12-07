#!/bin/bash

# installer for mylog.sh
# by tony baldwin - http://tonyb.us/dream

if [ != "$HOME/bin/" ]; then
	mkdir $HOME/bin/
	$PATH=$PATH:/$HOME/bin/
	export PATH
fi


echo "installing mylog.sh ... "
cp mylog $HOME/bin/mylog
chmod +x $HOME/bin/mylog

echo "Creating config files ... "
read -p "What is your prefered editor? (default is vim) " ed
if [[ $ed != "" ]]; then
	editor=$ed
else
	editor="/usr/bin/vim"
fi

mkdir $HOME/.mylog
echo "# mylog.sh config file" > $HOME/.mylog.conf
echo "$HOME/.mylog/" >> $HOME/.mylog.conf
echo "editor=$editor" >> $HOME/.mylog.conf

echo "Installation complete."

mylog h

exit
