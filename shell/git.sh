#!/usr/bin/env bash

# Clone a git repository and checkout to given branch
#
# Param[1]: Git repo remote url
# Param[2]: Branch name
# Param[3]: Destination Path (Optional. Default '/tmp')
function clone_git_repo {

  local _REPO_URL="$1"
  local _BRANCH_NAME="$2"
  local _LOCAL_BASE_DIR="$3"

  if [[ ! "${_LOCAL_BASE_DIR}" ]]; then
    _LOCAL_BASE_DIR="/tmp"
  fi

  local _REPO_NAME=$(basename "${_REPO_URL}" | sed "s#.git##g")

  rm -rf "${_LOCAL_BASE_DIR:?}/${_REPO_NAME:?}"

  git -C "${_LOCAL_BASE_DIR}" clone "${_REPO_URL}"

  git -C "${_LOCAL_BASE_DIR}/${_REPO_NAME}" checkout "${_BRANCH_NAME}" >/dev/null 2>&1

  if [ $? -eq 1 ]; then
    echo -e "\033[1;31m\n WARN: Branch '${_BRANCH_NAME}' does not exist on ${_REPO_NAME} repository!!!\n\033[0m"
    return 1
  fi

}