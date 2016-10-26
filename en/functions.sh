#!/bin/bash
jarvis_gmail () {
    local nb=$(curl -u $gmail_username:$gmail_password --silent "https://mail.google.com/mail/feed/atom" | sed -n "s/.*<fullcount>\(.*\)<\/fullcount>.*/\1/p")
    if [ $nb -ne 0 ]; then
        echo "You have $nb unread emails"
    else
        echo "You have no unread emails"
    fi
}
