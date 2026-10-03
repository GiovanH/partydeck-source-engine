#!/bin/bash

nmcli connection add type dummy ifname partylo con-name partylo \
  ipv4.method manual ipv4.addresses 10.99.0.1/32 ipv6.method disabled
nmcli connection up partylo
