###########################
# RAW: Mikrotik-Google-Meet
###########################
/ip firewall raw
rem [find address-list=Mikrotik-Google-Meet]
add action=add-dst-to-address-list address-list=Mikrotik-Google-Meet address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*meet.google.com* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP comment="Mikrotik-Google-Meet"
add action=add-dst-to-address-list address-list=Mikrotik-Google-Meet address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*workspace.turns.goog* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP
add action=add-dst-to-address-list address-list=Mikrotik-Google-Meet address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*meet.turns.goog* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP

/ip firewall address-list
rem [find list="Mikrotik-Google-Meet"]
add address=74.125.250.0/24 list=Mikrotik-Google-Meet
add address=142.250.82.0/24 list=Mikrotik-Google-Meet