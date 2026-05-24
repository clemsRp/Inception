#!/bin/bash

mkdir -p /var/run/vsftpd

# Get secrets variables
. /run/secrets/credentials

# Create user if needed
if ! id "$FTP_USER" >/dev/null 2>&1; then
    useradd -m -d /var/www/wordpress "$FTP_USER"
    echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd
    
    chown -R "$FTP_USER:$FTP_USER" /var/www/wordpress
    
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
fi

echo "Serveur FTP prêt pour l'utilisateur : $FTP_USER"

exec vsftpd /etc/vsftpd.conf
