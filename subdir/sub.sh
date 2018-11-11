#!/bin/bash

echo "\$PWD:"
echo $PWD

echo "You are running $0"
if [ ! -d oneDir ]; then
    mkdir oneDir
fi
exit 0