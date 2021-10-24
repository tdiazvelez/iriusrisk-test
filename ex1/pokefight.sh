#!/bin/bash

set -e
#set -x

POKEMON1=$1
POKEMON2=$2
API="https://pokeapi.co/api/v2/pokemon/"
PK1STAT=$(curl ${API}${POKEMON1} -s | jq '.stats' | grep -B3 'attack' | head -1 | awk '{printf $2}' | sed 's/,//')
PK2STAT=$(curl ${API}${POKEMON2} -s | jq '.stats' | grep -B3 'attack' | head -1 | awk '{printf $2}' | sed 's/,//') 


echo "${POKEMON1^} (${PK1STAT}) vs ${POKEMON2^} (${PK2STAT})"  
if [ $PK1STAT -gt $PK2STAT ] ; then
   echo "${POKEMON1^} wins!!"
else 
   echo "${POKEMON2^} wins!!"
fi









