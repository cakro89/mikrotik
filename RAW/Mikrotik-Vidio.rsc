##########################
# RAW: Mikrotik-Vidio
##########################
/ip firewall raw
rem [find address-list=Mikrotik-Vidio]
add action=add-dst-to-address-list address-list=Mikrotik-Vidio address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*vidio.com* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP comment="Vidio"
add action=add-dst-to-address-list address-list=Mikrotik-Vidio address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*.vidio.* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP

/ip firewall address-list
rem [find list="Mikrotik-Vidio"]
add address=216.137.32.0/19 list=Mikrotik-Vidio
add address=184.86.251.79 list=Mikrotik-Vidio
add address=2.19.117.97 list=Mikrotik-Vidio
add address=35.241.18.33 list=Mikrotik-Vidio
add address=35.190.83.167 list=Mikrotik-Vidio
add address=34.120.25.176 list=Mikrotik-Vidio
add address=34.117.241.252 list=Mikrotik-Vidio
add address=34.160.62.245 list=Mikrotik-Vidio
add address=34.149.115.28 list=Mikrotik-Vidio