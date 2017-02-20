#!/bin/bash
jv_pg_gmail_lg() {
    case "$1" in
        checking) echo "Je regarde...";;
        you_have_one_unread_email) echo "Vous avez reçu un email";;
        from_x) echo " de $2";;
        you_have_x_unread_emails) echo "Vous avez $2 emails non lus";;
        last_one_is_from_x) echo "Le dernier est de $2";;
        you_have_no_unread_emails) echo "Vous n'avez aucun email non lu";;
        *) jv_error "ERROR: unknown translation key: $1";;
    esac
}
