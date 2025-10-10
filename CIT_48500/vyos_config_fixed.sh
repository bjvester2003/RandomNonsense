#!/bin/vbash
# VyOS 1.5 Configuration Script (Fixed)
# ----------------------------------------
# Usage:
#   configure
#   source /path/to/vyosConfig.sh
#   commit
#   save
#   exit
# ----------------------------------------
# 
# ==============================
# INTERFACES
# ==============================
set interfaces ethernet eth0 address '149.166.26.135/24' 
set interfaces ethernet eth0 duplex 'auto'
set interfaces ethernet eth0 hw-id '00:50:56:9f:77:fd'
set interfaces ethernet eth0 smp_affinity 'auto'
set interfaces ethernet eth0 speed 'auto'
# 
set interfaces ethernet eth1 address '192.168.54.2/24'
set interfaces ethernet eth1 address '192.168.55.2/24'
set interfaces ethernet eth1 description 'VLAN55'
set interfaces ethernet eth1 duplex 'auto'
set interfaces ethernet eth1 hw-id '00:50:56:9f:0c:4a'
set interfaces ethernet eth1 smp_affinity 'auto'
set interfaces ethernet eth1 speed 'auto'
# 
set interfaces ethernet eth2 address '10.5.7.2/24'
set interfaces ethernet eth2 address '192.168.57.2/24'
set interfaces ethernet eth2 description 'VLAN57'
set interfaces ethernet eth2 duplex 'auto'
set interfaces ethernet eth2 hw-id '00:50:56:9f:1f:72'
set interfaces ethernet eth2 smp_affinity 'auto'
set interfaces ethernet eth2 speed 'auto'
# 
set interfaces ethernet eth3 address '10.20.20.2/24'
set interfaces ethernet eth3 address '192.168.20.2/24'
set interfaces ethernet eth3 description 'VLAN20'
set interfaces ethernet eth3 duplex 'auto'
set interfaces ethernet eth3 hw-id '00:50:56:9f:3c:2d'
set interfaces ethernet eth3 smp_affinity 'auto'
set interfaces ethernet eth3 speed 'auto'
# 
set interfaces ethernet eth4 address '10.10.10.2/24'
set interfaces ethernet eth4 address '192.168.10.2/24'
set interfaces ethernet eth4 description 'VLAN10'
set interfaces ethernet eth4 duplex 'auto'
set interfaces ethernet eth4 hw-id '00:50:56:9f:41:3e'
set interfaces ethernet eth4 smp_affinity 'auto'
set interfaces ethernet eth4 speed 'auto'
# 
set interfaces ethernet eth5 description 'TESTING'
set interfaces ethernet eth5 duplex 'auto'
set interfaces ethernet eth5 hw-id '00:50:56:9f:76:96'
set interfaces ethernet eth5 smp_affinity 'auto'
set interfaces ethernet eth5 speed 'auto'
# 
set interfaces loopback 'lo'
# 
# ==============================
# FIREWALL - global options
# ==============================
set firewall global-options all-ping 'enable'
set firewall global-options broadcast-ping 'disable'
set firewall global-options ipv6-receive-redirects 'disable'
set firewall global-options ipv6-src-route 'disable'
set firewall global-options ip-src-route 'disable'
set firewall global-options log-martians 'enable'
set firewall global-options receive-redirects 'disable'
set firewall global-options send-redirects 'enable'
set firewall global-options source-validation 'disable'
set firewall global-options syn-cookies 'enable'
set firewall global-options twa-hazards-protection 'disable'
# 
# ------------------------------
# ALLOW-ESTABLISHED rule set
# ------------------------------
set firewall ipv4 name ALLOW-ESTABLISHED default-action 'reject'
set firewall ipv4 name ALLOW-ESTABLISHED rule 10 action 'accept'
set firewall ipv4 name ALLOW-ESTABLISHED rule 10 state established 'enable'
set firewall ipv4 name ALLOW-ESTABLISHED rule 10 state related 'enable'
set firewall ipv4 name ALLOW-ESTABLISHED rule 20 action 'accept'
set firewall ipv4 name ALLOW-ESTABLISHED rule 20 description 'Allow PPTP access from the Internet'
set firewall ipv4 name ALLOW-ESTABLISHED rule 20 destination port '1723'
set firewall ipv4 name ALLOW-ESTABLISHED rule 20 protocol 'tcp'
# 
# ------------------------------
# eth0 interface filters (applied to eth2)
# ------------------------------
set firewall ipv4 name eth0-Inbound default-action 'accept'
set firewall ipv4 name eth0-Inbound rule 3000 action 'accept'
# 
set firewall ipv4 name eth0-Outbound default-action 'accept'
set firewall ipv4 name eth0-Outbound rule 10 action 'accept'
set firewall ipv4 name eth0-Outbound rule 10 state established 'enable'
set firewall ipv4 name eth0-Outbound rule 10 state related 'enable'
# 
# ------------------------------
# eth1 filters: inside, local, outside
# ------------------------------
set firewall ipv4 name eth1-inside-filter default-action 'accept'
set firewall ipv4 name eth1-inside-filter rule 10 action 'accept'
set firewall ipv4 name eth1-inside-filter rule 10 description 'Allow established from storage to management'
set firewall ipv4 name eth1-inside-filter rule 10 destination address '10.20.20.0/24'
set firewall ipv4 name eth1-inside-filter rule 10 source address '10.10.10.0/24'
set firewall ipv4 name eth1-inside-filter rule 10 state established 'enable'
set firewall ipv4 name eth1-inside-filter rule 3000 action 'drop'
set firewall ipv4 name eth1-inside-filter rule 3000 description 'Block all from storage to class'
set firewall ipv4 name eth1-inside-filter rule 3000 destination address '10.5.7.0/24'
set firewall ipv4 name eth1-inside-filter rule 3000 source address '10.10.10.0/24'
set firewall ipv4 name eth1-inside-filter rule 3010 action 'drop'
set firewall ipv4 name eth1-inside-filter rule 3010 description 'Block new from storage to management'
set firewall ipv4 name eth1-inside-filter rule 3010 destination address '10.20.20.0/24'
set firewall ipv4 name eth1-inside-filter rule 3010 source address '10.10.10.0/24'
set firewall ipv4 name eth1-inside-filter rule 3010 state new 'enable'
# 
set firewall ipv4 name eth1-local-filter default-action 'accept'
set firewall ipv4 name eth1-local-filter description 'Allow established from storage to management'
set firewall ipv4 name eth1-local-filter rule 10 action 'accept'
set firewall ipv4 name eth1-local-filter rule 10 description 'Allow established from storage to management'
set firewall ipv4 name eth1-local-filter rule 10 destination address '10.20.20.0/24'
set firewall ipv4 name eth1-local-filter rule 10 source address '10.10.10.0/24'
set firewall ipv4 name eth1-local-filter rule 10 state established 'enable'
set firewall ipv4 name eth1-local-filter rule 3000 action 'drop'
set firewall ipv4 name eth1-local-filter rule 3000 description 'Block all from storage to class'
set firewall ipv4 name eth1-local-filter rule 3000 destination address '10.5.7.0/24'
set firewall ipv4 name eth1-local-filter rule 3000 source address '10.10.10.0/24'
set firewall ipv4 name eth1-local-filter rule 3010 action 'drop'
set firewall ipv4 name eth1-local-filter rule 3010 description 'Block new from storage to management'
set firewall ipv4 name eth1-local-filter rule 3010 destination address '10.20.20.0/24'
set firewall ipv4 name eth1-local-filter rule 3010 source address '10.10.10.0/24'
set firewall ipv4 name eth1-local-filter rule 3010 state new 'enable'
# 
set firewall ipv4 name eth1-outside-filter default-action 'accept'
set firewall ipv4 name eth1-outside-filter rule 10 action 'accept'
set firewall ipv4 name eth1-outside-filter rule 10 description 'Allow new, established from MGMNT to Storage'
set firewall ipv4 name eth1-outside-filter rule 10 source address '10.20.20.0/24'
set firewall ipv4 name eth1-outside-filter rule 10 state established 'enable'
set firewall ipv4 name eth1-outside-filter rule 10 state new 'enable'
set firewall ipv4 name eth1-outside-filter rule 3000 action 'drop'
set firewall ipv4 name eth1-outside-filter rule 3000 destination address '10.10.10.0/24'
set firewall ipv4 name eth1-outside-filter rule 3000 source address '10.5.7.0/24'
# 
# ------------------------------
# eth2 interface filters
# ------------------------------
set firewall ipv4 name eth2-Inbound default-action 'accept'
set firewall ipv4 name eth2-Inbound rule 3000 action 'accept'
# 
set firewall ipv4 name eth2-Outbound default-action 'accept'
set firewall ipv4 name eth2-Outbound rule 10 action 'accept'
set firewall ipv4 name eth2-Outbound rule 10 state established 'enable'
set firewall ipv4 name eth2-Outbound rule 10 state related 'enable'
# 
# ------------------------------
# eth3 filters: inside, local, outside
# ------------------------------
set firewall ipv4 name eth3-inside-filter default-action 'accept'
set firewall ipv4 name eth3-inside-filter rule 10 action 'accept'
set firewall ipv4 name eth3-inside-filter rule 10 description 'Allow new, established from management to storage'
set firewall ipv4 name eth3-inside-filter rule 10 destination address '10.10.10.0/24'
set firewall ipv4 name eth3-inside-filter rule 10 source address '10.20.20.0/24'
set firewall ipv4 name eth3-inside-filter rule 10 state established 'enable'
set firewall ipv4 name eth3-inside-filter rule 10 state new 'enable'
set firewall ipv4 name eth3-inside-filter rule 20 action 'accept'
set firewall ipv4 name eth3-inside-filter rule 20 description 'Allow new, established from management to class'
set firewall ipv4 name eth3-inside-filter rule 20 destination address '10.5.7.0/24'
set firewall ipv4 name eth3-inside-filter rule 20 source address '10.20.20.0/24'
set firewall ipv4 name eth3-inside-filter rule 20 state established 'enable'
set firewall ipv4 name eth3-inside-filter rule 20 state new 'enable'
# 
set firewall ipv4 name eth3-local-filter default-action 'accept'
set firewall ipv4 name eth3-local-filter rule 30 action 'accept'
set firewall ipv4 name eth3-local-filter rule 30 description 'Allow new, established from management to storage'
set firewall ipv4 name eth3-local-filter rule 30 destination address '10.10.10.0/24'
set firewall ipv4 name eth3-local-filter rule 30 source address '10.20.20.0/24'
set firewall ipv4 name eth3-local-filter rule 30 state established 'enable'
set firewall ipv4 name eth3-local-filter rule 30 state new 'enable'
set firewall ipv4 name eth3-local-filter rule 40 action 'accept'
set firewall ipv4 name eth3-local-filter rule 40 description 'Allow new, established from management to class'
set firewall ipv4 name eth3-local-filter rule 40 destination address '10.5.7.0/24'
set firewall ipv4 name eth3-local-filter rule 40 source address '10.20.20.0/24'
set firewall ipv4 name eth3-local-filter rule 40 state established 'enable'
set firewall ipv4 name eth3-local-filter rule 40 state new 'enable'
# 
set firewall ipv4 name eth3-outside-filter default-action 'accept'
set firewall ipv4 name eth3-outside-filter rule 3000 action 'drop'
set firewall ipv4 name eth3-outside-filter rule 3000 description 'Block new from storage to management'
set firewall ipv4 name eth3-outside-filter rule 3000 destination address '10.20.20.0/24'
set firewall ipv4 name eth3-outside-filter rule 3000 source address '10.10.10.0/24'
set firewall ipv4 name eth3-outside-filter rule 3000 state new 'enable'
set firewall ipv4 name eth3-outside-filter rule 3010 action 'drop'
set firewall ipv4 name eth3-outside-filter rule 3010 description 'Block new from class to management'
set firewall ipv4 name eth3-outside-filter rule 3010 destination address '10.20.20.0/24'
set firewall ipv4 name eth3-outside-filter rule 3010 source address '10.5.7.0/24'
set firewall ipv4 name eth3-outside-filter rule 3010 state new 'enable'
# 
# ------------------------------
# eth4 filters: inside, local, outside
# ------------------------------
set firewall ipv4 name eth4-inside-filter default-action 'accept'
set firewall ipv4 name eth4-inside-filter rule 10 action 'accept'
set firewall ipv4 name eth4-inside-filter rule 10 description 'Allow established from class to management'
set firewall ipv4 name eth4-inside-filter rule 10 destination address '10.20.20.0/24'
set firewall ipv4 name eth4-inside-filter rule 10 source address '10.5.7.0/24'
set firewall ipv4 name eth4-inside-filter rule 10 state established 'enable'
set firewall ipv4 name eth4-inside-filter rule 3000 action 'drop'
set firewall ipv4 name eth4-inside-filter rule 3000 description 'Block all from class to storage'
set firewall ipv4 name eth4-inside-filter rule 3000 destination address '10.10.10.0/24'
set firewall ipv4 name eth4-inside-filter rule 3000 source address '10.5.7.0/24'
set firewall ipv4 name eth4-inside-filter rule 3010 action 'drop'
set firewall ipv4 name eth4-inside-filter rule 3010 description 'Block new from class to management'
set firewall ipv4 name eth4-inside-filter rule 3010 destination address '10.20.20.0/24'
set firewall ipv4 name eth4-inside-filter rule 3010 source address '10.5.7.0/24'
set firewall ipv4 name eth4-inside-filter rule 3010 state new 'enable'
# 
set firewall ipv4 name eth4-local-filter default-action 'accept'
set firewall ipv4 name eth4-local-filter rule 10 action 'accept'
set firewall ipv4 name eth4-local-filter rule 10 description 'Allow established from class to management'
set firewall ipv4 name eth4-local-filter rule 10 destination address '10.20.20.0/24'
set firewall ipv4 name eth4-local-filter rule 10 source address '10.5.7.0/24'
set firewall ipv4 name eth4-local-filter rule 10 state established 'enable'
set firewall ipv4 name eth4-local-filter rule 3000 action 'drop'
set firewall ipv4 name eth4-local-filter rule 3000 description 'Block all from class to storage'
set firewall ipv4 name eth4-local-filter rule 3000 destination address '10.10.10.0/24'
set firewall ipv4 name eth4-local-filter rule 3000 source address '10.5.7.0/24'
set firewall ipv4 name eth4-local-filter rule 3010 action 'drop'
set firewall ipv4 name eth4-local-filter rule 3010 description 'Block new from class to management'
set firewall ipv4 name eth4-local-filter rule 3010 destination address '10.20.20.0/24'
set firewall ipv4 name eth4-local-filter rule 3010 source address '10.5.7.0/24'
set firewall ipv4 name eth4-local-filter rule 3010 state new 'enable'
# 
set firewall ipv4 name eth4-outside-filter default-action 'accept'
set firewall ipv4 name eth4-outside-filter rule 10 action 'accept'
set firewall ipv4 name eth4-outside-filter rule 10 description 'Allow new, established from management to class'
set firewall ipv4 name eth4-outside-filter rule 10 destination address '10.5.7.0/24'
set firewall ipv4 name eth4-outside-filter rule 10 source address '10.20.20.0/24'
set firewall ipv4 name eth4-outside-filter rule 10 state established 'enable'
set firewall ipv4 name eth4-outside-filter rule 10 state new 'enable'
set firewall ipv4 name eth4-outside-filter rule 3000 action 'drop'
set firewall ipv4 name eth4-outside-filter rule 3000 description 'Block all from storage to class'
set firewall ipv4 name eth4-outside-filter rule 3000 destination address '10.5.7.0/24'
set firewall ipv4 name eth4-outside-filter rule 3000 source address '10.10.10.0/24'
# 
# ==============================
# APPLY FIREWALL TO INTERFACES
# ==============================
# Apply eth0 rules to eth2 interface
set interfaces ethernet eth2 firewall in ipv4 name 'eth0-Inbound'
set interfaces ethernet eth2 firewall local ipv4 name 'eth0-Inbound'
set interfaces ethernet eth2 firewall out ipv4 name 'eth0-Outbound'
# 
# ==============================
# NAT
# ==============================
set nat destination
# 
set nat source rule 10 destination address '0.0.0.0/0'
set nat source rule 10 outbound-interface 'eth0'
set nat source rule 10 source address '192.168.57.0/24'
set nat source rule 10 translation address '149.166.26.135'
# 
set nat source rule 100 destination address '0.0.0.0/0'
set nat source rule 100 outbound-interface 'eth0'
set nat source rule 100 source address '192.168.55.0/24'
set nat source rule 100 translation address '149.166.26.135'
# 
# ==============================
# SERVICES
# ==============================
set service ssh listen-address '10.5.7.2'
set service ssh listen-address '192.168.57.2'
set service ssh port '22'
# 
# ==============================
# SYSTEM
# ==============================
set system config-management commit-revisions '20'
set system console device ttyS0 speed '9600'
set system gateway-address '149.166.26.1'
set system host-name 'vyos'
set system login banner pre-login 'ALERT! Your IP, Login Time, and Username are monitored. This service is restricted to authorized users only. All activities on this system are being logged.'
set system login user vyos authentication encrypted-password '$1$OpdUTrlZ$DO9UEmN6xNz/7tJrwhxl/1'
set system login user vyos level 'admin'
set system ntp server '0.pool.ntp.org'
set system ntp server '1.pool.ntp.org'
set system ntp server '2.pool.ntp.org'
set system package auto-sync '1'
set system package repository community components 'main'
set system package repository community distribution 'helium'
set system package repository community password ''
set system package repository community url 'http://packages.vyos.net/vyos'
set system package repository community username ''
set system syslog global facility all level 'notice'
set system syslog global facility protocols level 'debug'
set system time-zone 'US/East-Indiana'