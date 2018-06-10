#!/bin/bash

if [ $1 == "date" ]; then
  git log -1 --pretty=format:"%ad" --date=short
elif [ $1 == "commit" ]; then
  if [[ -z ${VERSION+x} || ${#VERSION} -le 0 ]]; then
    git rev-parse --short HEAD
  else
    echo ${VERSION}
  fi
elif [ $1 == "url" ]; then
  URL=$(git config --get remote.origin.url | sed -e 's#^git@#https://#' -e 's#systems:#systems/#' -e 's#_#\\_#g' -e 's#.git$##' )
  if [ -z "$URL" ]; then
    echo "https://git.cryptic.systems"
  else
    echo $URL
  fi
elif [ $1 == "contributor" ]; then
  CONTRIBUTORS=$(git log | grep 'Author:' | cut -d ' ' -f 2,3,4 | sed -e 's/<//g' -e 's/>//g' | sort -u)
  for line in "$CONTRIBUTORS"; do
    echo $line
  done
fi
