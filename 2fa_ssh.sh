#!/bin/bash

apt install ssh libpam-google-authenticator -y

echo '# Use Google Auth for ssh logins\nauth required pam_google_authenticator.so' >> /etc/pam.d/sshd
sed -i 's/^ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config 2>/dev/null

systemctl restart ssh

# Następnie przelogowac sie na uzytkownika i wpisac:
# google-authenticator
# y -> y -> n -> y