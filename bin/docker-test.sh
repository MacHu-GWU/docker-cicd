#!/bin/bash

set -e

dir_bin="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
dir_project_root="$( dirname "${dir_bin}" )"
source ${dir_bin}/source/lib.sh

repo="$(cat ${dir_project_root}/docker-hub-repo-name)"

python "${dir_bin}/docker-test-validate-args.py" "$1"

set +e

tag="$1"
build_context_dir="${dir_project_root}/${tag}"


# image NOT exists
if [[ "$(docker images -q "${repo}:${tag}" 2> /dev/null)" == "" ]]; then
    print_colored_line $color_red "image ${repo}:${tag} not exists on local!"
    print_colored_line $color_red "run \"./bin/docker-build.sh ${tag}\" to build the image first."
    exit 1
fi

# run test
docker run \
    --rm \
    --mount type=bind,source="${build_context_dir}",target="/tmp/docker-test" \
    "${repo}:${tag}" \
    sh /tmp/docker-test/test.sh

return_value=$?
if [ $return_value -ne 0 ]; then
    print_colored_line $color_red "${tag}/test.sh FAILED!"
else
    print_colored_line $color_green "${tag}/test.sh PASSED!"
fi
