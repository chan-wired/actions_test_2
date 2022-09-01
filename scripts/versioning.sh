#!/bin/bash

PACKAGE_JSON_FILE="./package.json"
if [[ -f ${PACKAGE_JSON_FILE} ]]; then

  case "$1" in
    --major)
      npx standard-version --release-as major --skip.commit --skip.tag
      npm version minor -m 'chore(release): v%s'
      ;;
    --minor)
      npx standard-version --release-as minor --skip.commit --skip.tag
      ;;
    --patch)
      npx standard-version --release-as patch --skip.commit --skip.tag
      ;;
    --pre-minor)
      npx standard-version --release-as minor --prerelease stage --skip.commit --skip.tag
      ;;
    --pre-patch)
      npx standard-version --release-as patch --prerelease stage --skip.commit --skip.tag
      ;;
    *)
      echo "version not changed"
      exit
      ;;
    esac

  ### changelog.html 파일 생성
  # npm run showdown

  ### get version
  # VERSION=$(cat ${PACKAGE_JSON_FILE} | python3 -c "import sys, json; print(json.load(sys.stdin)['version'])")
  # echo "${VERSION}"

  ### git commit and tag
  # git add -u
  ### TODO: version prefix를 standard-version에서 가져올 방법을 찾아봐야할듯
  # git commit -m "chore(release): ${VERSION}"
  # git tag "v${VERSION}"
fi
