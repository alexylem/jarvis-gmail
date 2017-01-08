#!/bin/bash
jv_pg_gmail_lg() {
    case "$1" in
        checking) echo "Ich überprüfe...";;
        you_have_one_unread_email) echo "Sie haben eine ungelesene E-Mail";;
        from_x) echo "Von $2";;
        you_have_x_unread_emails) echo "Sie haben $2 ungelesene E-Mails";;
        last_one_is_from_x) echo "Letzter ist von $2";;
        you_have_no_unread_emails) echo "Sie haben keine ungelesene E-Mail";;
        *) jv_error "ERROR: unknown translation key: $1";;
    esac
}
