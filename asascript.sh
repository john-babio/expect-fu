#!/bin/bash

echo "enter Username:"
read USERNAME; export USERNAME

echo "enter Password"
read PASSWORD; export PASSWORD


/usr/bin/expect -c '

spawn ssh $env(USERNAME)@10.10.100.1
expect -re ".*password:"
send $env(PASSWORD)\r"
expect -re ".*>"
send "enable\r"
expect -re "Password:.*"
send "$env(PASSWORD)\r"
expect -re ".*#"
send "config t\r"
expect -re ".*(config)#"
'

