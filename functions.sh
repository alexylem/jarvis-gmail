jv_pg_gmail () {
    local last_check_file="/tmp/jarvis_gmail_last_check"
    local last_from
    local in_entry=false
    local stop=false
    local first_entry=true
    local nb_unread=0
    local last_check="$(cat "$last_check_file" 2>/dev/null)"
    
    $gmail_say_checking && say "$(jv_pg_gmail_lg checking)"
    
    while jv_read_dom; do
        case "$ENTITY" in
            #fullcount) nb_unread="$CONTENT";;
            H1)     jv_error "ERROR: $CONTENT"
                    jv_warning "HELP: Check your credentials in plugin configuration and make sure secure apps access is enabled"
                    return 1;;
            title)  $first_entry && last_title="$CONTENT";;
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
    
    if [ "$nb_unread" -eq 1 ]; then
        say "$(jv_pg_gmail_lg you_have_x_unread_emails $nb_unread)"
        $gmail_say_from && say "$(jv_pg_gmail_lg last_one_is_from_x $last_from)$($gmail_say_title && echo ": $last_title")"
    elif [ "$nb_unread" -gt 1 ]; then
        say "$(jv_pg_gmail_lg you_have_one_unread_email)"
        $gmail_say_from && say "$(jv_pg_gmail_lg from_x $last_from)$($gmail_say_title && echo ": $last_title")"
    else
        $gmail_say_no_new && say "$(jv_pg_gmail_lg you_have_no_unread_emails)"
    fi
    return 0
}
