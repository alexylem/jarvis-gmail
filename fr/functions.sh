#!/bin/bash
jv_pg_gmail () {
    local last_check_file="/tmp/jarvis_gmail_last_check"
    local last_from
    local in_entry=false
    local stop=false
    local first_entry=true
    local nb_unread=0
    local last_check="$(cat "$last_check_file" 2>/dev/null)"
    
    while jv_read_dom; do
        case "$ENTITY" in
            #fullcount) nb_unread="$CONTENT";;
            H1)    echo "ERROR: $CONTENT"
                   return 1;;
            title) $first_entry && last_title="$CONTENT";;
            issued) issued="$CONTENT"
                    $first_entry && echo "$issued" > "$last_check_file"
                    if [[ "$gmail_only_new" == false ]] || [[ "$issued" > "$last_check" ]]; then
                        ((nb_unread++))
                    else
                        stop=true
                    fi
                    ;;
            name) $first_entry && last_from="$CONTENT";;
            /entry) $first_entry && first_entry=false
                    $stop && break
                    ;;
        esac
    done < <(curl -u $gmail_username:$gmail_password --silent "https://mail.google.com/mail/feed/atom")
    
    if [ "$nb_unread" -ne 0 ]; then
        printf "Vous avez $nb_unread emails non lus"
        $gmail_say_from && printf ", le dernier est de $last_from"
        $gmail_say_title && printf ": $last_title"
        echo
    else
        $gmail_say_no_new && echo "Vous n'avez aucun email non lu"
    fi
}
