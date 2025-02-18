#!/bin/bash

declare -i time=0
echo "Timeout is set to $timeout s"
echo "Expected status code is set to $expectedStatus"


while (true); do

resp=`curl -s --head -i "$url"`
httpCode=`echo "$resp" | head -n 1 | cut -d ' ' -f 2`
responseHeader=`echo "$resp" | grep "$headerName"`



if [[ $httpCode -eq $expectedStatus ]]; then
  echo "Status is $expectedStatus"

  if [ -z "${headerName}" ]; then
    echo "Not looking for header, all criteria met"
    exit
  fi

  if [[ $responseHeader == *"$expectedHeaderValue"* ]]; then
    echo "Header as expected, all criteria met"
    exit
  else
    echo "Header is not expected: $responseHeader"
  fi
fi
echo "Conditions not met, waiting"
time=$((time + 15))

echo "Run for $time s"

if [[ $time -ge $timeout ]]
then
  echo "Timed out after $timeout seconds"
  exit
fi


sleep 15
done

