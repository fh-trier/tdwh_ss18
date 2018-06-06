#!/usr/bin/env bash
if [ -f "error_cust_data.csv" ]; then
  rm "error_cust_data.csv"
fi
cat "../csv/awk_cust_data.csv" | awk -F ';' -f $1
