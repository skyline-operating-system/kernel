#!/bin/sh

ARCH="${ARCH:-default x86_64}"
SUBARCH="${SUBARCH}"
BOOTLOADER="${BOOTLOADER:-default uefi}"

docker run \
    -e SKYLINE_TAG=master \
    -e SKYLINE_ARCH=$ARCH \
    -e SKYLINE_SUB_ARCH=$SUBARCH \
    -e SKYLINE_BOOTLOADER=$BOOTLOADER \
    -e SKYLINE_COMMIT_HASH=$(git rev-parse HEAD) \
    --mount type=bind,source="$(realpath $PWD)",target=/code/kernel \
    ghcr.io/skyline-operating-system/kernel-buildbot:latest
