#!/bin/bash

# This script creates a new user on the local system.
# If sucessfully created account, the username, password, and hostname of the account will displayed.

# Check if script is executed with superuser (root).
if [[ ${UID} -ne 0 ]]
then
  echo 'You are NOT superuser (root). Please run with sudo or as root.'
  exit 1
fi

# Ask to enter username (login).
read -p 'Enter the username to create: ' USER_NAME

# Ask to enter real name (comment).
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

# Ask to enter initial password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create new user.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check if useradd succeeded.
if [[ ${?} -ne 0 ]]
then
  echo 'useradd failed!'
  exit 1
fi

# Set the password. 
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Check if passwd succeeded.
if [[ ${?} -ne 0 ]]
then
 echo 'passwd failed!'
 exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and host.
echo -e "\nusername:\n${USER_NAME}\n\npassword:\n${PASSWORD}\n\nhost:\n${HOSTNAME}\n"
exit 0

 

