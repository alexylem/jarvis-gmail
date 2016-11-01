#!/bin/bash

jv_pg_gmail () {
    local nb_unread last_from
    
    while jv_read_dom; do
        case "$ENTITY" in
            fullcount) nb_unread="$CONTENT";;
            name) last_from="$CONTENT"
                  break;;
        esac
    done < <(curl -u $gmail_username:$gmail_password --silent "https://mail.google.com/mail/feed/atom")
    
    if [ $nb_unread -ne 0 ]; then
        echo "You have $nb_unread unread emails, last one is from $last_from"
    else
        echo "You have no unread emails"
    fi
}
