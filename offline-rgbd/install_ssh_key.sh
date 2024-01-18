#!/bin/bash

if [ $# -ne 2 ]; then
  echo "USAGE: $0 host keyfile"
  exit 1
fi

hostname=$1
keyfile=$2

# Copy key to remote host
scp $keyfile dis@${hostname}:"C:\\ProgramData\\ssh\\administrators_authorized_keys"
echo "Key copied successfully!"

# Set permissions for key
ssh dis@${hostname} icacls.exe "C\\:ProgramData\\ssh\\administrators_authorized_keys" /inheritance:r /grant "Administrators:F" /grant "SYSTEM:F"
