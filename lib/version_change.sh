#!/usr/bin/env bash

version_file=${1}
version=$(<${version_file})

while true; do
    echo "Enter new version (default: ${version}):"
    read new_version

    if [[ -z "${new_version}" ]]; then break; fi # -z checks empty string

    if [[ "${new_version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        version=${new_version}
        break
    fi

    echo "Invalid version format (${new_version})"
done

echo ${version} > ${version_file}
echo "Version changed to ${version}"
exit 0
