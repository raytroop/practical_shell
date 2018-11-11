#!/bin/bash
echo "\$PWD:"
echo $PWD

pushd subdir > /dev/null
bash sub.sh
popd > /dev/null

echo
# $PWD depend on where you run the program rather than where the program is
bash subdir/sub.sh

exit 0