# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    create.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tkomeno <tkomeno@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/21 21:45:21 by tkomeno           #+#    #+#              #
#    Updated: 2022/11/21 21:45:40 by tkomeno          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

Red="\x1b[31m"
Green="\x1b[32m"
Cyan="\x1b[36m"
NoColor="\x1b[39m"

echo "$Cyan\c"
read -p "What is your username on GitHub? " USERNAME
USERNAME=${USERNAME:-"riceset"}

read -p "What is your 'libft' called on GitHub? " LIBFT
LIBFT=${LIBFT:-"libft"}

echo "What protocol would you like to use to clone it? "
read -p "HTTPS or SSH? " PROTOCOL
PROTOCOL=${PROTOCOL:-"SSH"}

echo "Creating directories..."
mkdir -p sources includes libraries
echo "$Green\c"
echo "Done."

echo "$Cyan\c"
echo "Cloning your 'libft' into 'libraries'..."
if [[ $PROTOCOL == "SSH" || $PROTOCOL == "ssh" ]]; then
	git clone git@github.com:$USERNAME/$LIBFT.git libraries/libft 2> /dev/null
elif [[ $PROTOCOL == "HTTPS" || $PROTOCOL == "https" ]]; then
	git clone https://github.com/$USERNAME/$LIBFT.git libraries/libft 2> /dev/null
else
	echo "$Red\c"
	echo "Invalid protocol."
	echo "$NoColor\c"
	exit 1
fi
echo "$Green\c"
echo "Done."
echo "$NoColor\c"

