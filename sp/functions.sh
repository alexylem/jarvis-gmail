#!/bin/bash
jv_pg_gmail_lg() {
    case "$1" in
        checking) echo "Compruebo...";;
        you_have_one_unread_email) echo "Tienes un correo electrónico no leído";;
        from_x) echo " de $2";;
        you_have_x_unread_emails) echo "Tienes $1 correos electrónico no leído";;
        last_one_is_from_x) echo "El último es de $2";;
        you_have_no_unread_emails) echo "No tienes correo no leído";;
        *) jv_error "ERROR: unknown translation key: $1";;
    esac
}
