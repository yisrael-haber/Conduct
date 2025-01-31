#!/bin/ash

apk add openssh \ 
/usr/bin/ssh-keygen -A \
/usr/sbin/sshd -D &