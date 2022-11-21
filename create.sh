#!/bin/bash

#TODO: COLORS
#TODO: ASK CLONING METHOD

read -p "What is your username on GitHub? " USERNAME
USERNAME=${USERNAME:-"riceset"}

read -p "What is your 'libft' called on GitHub? " LIBFT
LIBFT=${LIBFT:-"libft"}

echo "What protocol would you like to use to clone it? "
read -p "HTTPS or SSH? " PROTOCOL
PROTOCOL=${PROTOCOL:-"SSH"}

echo "Creating directories..."
mkdir -p sources includes libraries
echo "Done."

echo "Cloning your 'libft' into 'libraries'..."
if [[ $PROTOCOL == "SSH" || $PROTOCOL == "ssh" ]]; then
	git clone git@github.com:$USERNAME/$LIBFT.git libraries/libft 2> /dev/null
elif [[ $PROTOCOL == "HTTPS" || $PROTOCOL == "https" ]]; then
	echo "HTTPS"
	git clone https://github.com/$USERNAME/$LIBFT.git libraries/libft 2> /dev/null
else
	echo "Invalid protocol."
	exit 1
fi
echo "Done."
