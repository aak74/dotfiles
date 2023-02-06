show-cert-k () {
    kubectl --context $1 -n $2 get secrets $3 -o yaml | grep 'tls.crt' | cut -c 12- | base64 --decode | openssl x509 -in /dev/stdin  -dates -issuer -text
}

show-cert () {
    echo | openssl s_client -connect $1:443 2>/dev/null | openssl x509 -dates -issuer -text
}

show-cert-f () {
    echo | openssl x509 -in $1 -text 2>/dev/null | openssl x509 -dates -issuer -text
}

show-cert-y () {
    grep 'tls.crt:' $1 | cut -c 12- | base64 --decode | openssl x509 -in /dev/stdin -dates -issuer -text
}

