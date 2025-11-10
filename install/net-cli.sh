#!/bin/bash

# those packages provide e.g. dig nslookup netstat
sudo pacma -S --noconfirm --needed bind-tools net-tools traceroute
