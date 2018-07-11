#!/bin/bash

# Enable globstar
shopt -s globstar

# Define your credentials as source file or environment variable
source ~/.config/oracle/passwd/galway.sh
# USER="sdsm"
# PASSWD="sdsm"
# HOST="localhost"

# Path to sqlplus
SQLPLUS="$(which sqlplus)"
# SQLPLUS="/opt/oracle/instantclient/sqlplus"

echo "Starting Executing SQL-Files to drop/create tables for sqlldr"
sleep 2

for f in $(ls ./loesungen/**/*.sql); do
${SQLPLUS} ${USER}/${PASSWD}@${HOST} << HERE
start $f
HERE
done
