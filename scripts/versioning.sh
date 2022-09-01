#!/bin/bash

PACKAGE_JSON_FILE="./package.json"
if [[ -f ${PACKAGE_JSON_FILE} ]]; then

  case "$1" in
    --major)
      npx standard-version --release-as major
      ;;
    --minor)
      npx standard-version --release-as minor
      ;;
    --patch)
      npx standard-version --release-as patch
      ;;
    --pre-minor)
      npx standard-version --release-as minor --prerelease stage
      ;;
    --pre-patch)
      npx standard-version --release-as patch --prerelease stage
      ;;
    *)
      echo "version not changed"
      exit
      ;;
    esac

  # changelog.html 파일 생성
  # npm run showdown
fi
