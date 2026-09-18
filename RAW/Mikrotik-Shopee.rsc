##########################
# RAW: Mikrotik-Shopee
##########################
/ip firewall raw
rem [find address-list=Mikrotik-Shopee]
add action=add-dst-to-address-list address-list=Mikrotik-Shopee address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*shopee.com* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP comment="Mikrotik-Shopee"
add action=add-dst-to-address-list address-list=Mikrotik-Shopee address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*.shopee.* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP
add action=add-dst-to-address-list address-list=Mikrotik-Shopee address-list-timeout=1d chain=prerouting protocol=tcp tls-host=*.shopeemobile.* dst-address-list=!LOCAL-IP src-address-list=LOCAL-IP

/ip firewall address-list
rem [find list="Mikrotik-Shopee"]
add address=103.70.16.0/22 list=Mikrotik-Shopee
add address=103.70.16.0/24 list=Mikrotik-Shopee
add address=103.70.17.0/24 list=Mikrotik-Shopee
add address=103.70.18.0/24 list=Mikrotik-Shopee
add address=103.70.19.0/24 list=Mikrotik-Shopee