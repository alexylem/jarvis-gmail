#!/bin/bash

jarvis_gmail () {
    local nb=$(curl -u $gmail_username:$gmail_password --silent "https://mail.google.com/mail/feed/atom" | sed -n "s/.*<fullcount>\(.*\)<\/fullcount>.*/\1/p")
    if [ $nb -ne 0 ]; then
        echo "Vous avez $nb emails non lus"
    else
        echo "Vous n'avez aucun email non lu"
}
