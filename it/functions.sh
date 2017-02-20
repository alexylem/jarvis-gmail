#!/bin/bash
#!/bin/bash
jv_pg_gmail_lg() {
    case "$1" in
        checking) echo "Controllo la posta...";;
        you_have_one_unread_email) echo "È presente una mail da leggere";;
        from_x) echo " di $2";;
        you_have_x_unread_emails) echo "Ci sono $2 mail da leggere";;
        last_one_is_from_x) echo "L'ultima mail è di $2";;
        you_have_no_unread_emails) echo "Non ci sono mail da leggere";;
        *) jv_error "ERROR: unknown translation key: $1";;
    esac
}
