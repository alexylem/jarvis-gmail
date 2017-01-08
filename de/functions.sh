#!/bin/bash
jv_pg_gmail_lg() {
    case "$1" in
        checking) echo "I check...";;
        you_have_one_unread_email) echo "You have one unread email";;
        from_x) echo "From $2";;
        you_have_x_unread_emails) echo "You have $2 unread emails";;
        last_one_is_from_x) echo "Last one is from $2";;
        you_have_no_unread_emails) echo "You have no unread email";;
        *) jv_error "ERROR: unknown translation key: $1";;
    esac
}
