#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "USAGE: $0 <build-dir> <rsync_destination>"
  exit 1
fi

#BUILD_DIR="build/vbox-"`VBoxManage --version`
BUILD_DIR=$1
BUILD_FILE_PREFIX="built-for-virtualbox"
BUILD_FILE=$BUILD_DIR/$BUILD_FILE_PREFIX-`VBoxMAnage --version`.txt
DESTINATION=$2

# Delete old build file
rm -f ${BUILD_DIR}/${BUILD_FILE_PREFIX}-*
# Generate build file
for BOX in $BUILD_DIR/*.box; do
  BOX_CTIME=$(stat -Lf "%Sm" -t "%Y-%m-%dT%H:%M:%S" $BOX)
  echo "${BOX_CTIME}: ${BOX}" >> $BUILD_FILE
done

# Transfer stuff to destination
rsync -av \
  --exclude=".gitkeep" \
  --delete \
  --stats \
  --progress \
  $BUILD_DIR/ $DESTINATION/

exit 0

