#!/bin/bash

set -e

dir_bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
dir_project_root="$( dirname "${dir_bin}" )"
source ${dir_bin}/source/lib.sh

repo="$(cat ${dir_project_root}/docker-hub-repo-name)"

python "${dir_bin}/docker-build-validate-args.py" "$1"

tag="$1"
build_context_dir="${dir_project_root}/${tag}"

# if image exists
if ! [[ "$(docker images -q "${repo}:${tag}" 2> /dev/null)" == "" ]]; then
    print_colored_line $color_cyan "remove local existing image ${repo}:${tag} ..."
    docker image rm "${repo}:${tag}"
fi

docker build -t "${repo}:${tag}" "${build_context_dir}"
