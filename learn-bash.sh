#!/bin/bash

# a positional parameters e.g. ./learn-bash.sh Nicholas Eyes
name=$1
compliment=$2
user=$(whoami)
date=$(date)
pwd=$(pwd)

echo "Good morning $user! Nice $compliment"
sleep 1
echo "The date is $date"