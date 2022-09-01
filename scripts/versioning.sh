#!/bin/bash

PACKAGE_JSON_FILE="./package.json"
WHICH_VERSION_ENV_FILE="./which_version.env"
if [[ -f ${PACKAGE_JSON_FILE} && -f ${WHICH_VERSION_ENV_FILE} ]]; then
  VERSION_TYPE="$(cat ${WHICH_VERSION_ENV_FILE})"

  case ${VERSION_TYPE} in
    "[Major]")
      npx standard-version --release-as major --skip.commit --skip.tag
      #echo "test: npx standard-version --release-as major --skip.commit --skip.tag"
      ;;
    "[Minor]")
      npx standard-version --release-as minor --skip.commit --skip.tag
      #echo "test: npx standard-version --release-as minor --skip.commit --skip.tag"
      ;;
    "[Patch]")
      npx standard-version --release-as patch --skip.commit --skip.tag
      #echo "test: npx standard-version --release-as patch --skip.commit --skip.tag"
      ;;
    "[PreMinor]")
      npx standard-version --release-as minor --prerelease stage --skip.commit --skip.tag
      #echo "test: npx standard-version --release-as patch --skip.commit --skip.tag"
      ;;
    "[PrePatch]")
      npx standard-version --release-as patch --prerelease stage --skip.commit --skip.tag
      #echo "test: npx standard-version --release-as patch --skip.commit --skip.tag"
      ;;
    *)
      echo "version not changed"
      exit
      ;;
    esac

  # changelog.html 파일 생성
  # npm run showdown

  # get version
  VERSION=$(cat ${PACKAGE_JSON_FILE} | python3 -c "import sys, json; print(json.load(sys.stdin)['version'])")
  echo "${VERSION}"

  # which_version.env 파일 비우기
  echo "" > ${WHICH_VERSION_ENV_FILE}

  # git commit and tag
  git add -u
  # TODO: version prefix를 standard-version에서 가져올 방법을 찾아봐야할듯
  git commit -m "chore(release): ${VERSION}"
  git tag "v${VERSION}"
fi
