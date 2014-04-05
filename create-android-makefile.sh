#!/bin/sh

if [ ! -d "$1" ]; then
    echo "bad params" >&2
fi

cd $1

echo "LOCAL_PATH := \$(call my-dir)"
echo

for l in libboost_*.a; do
    name=`echo $l | sed 's/lib\(boost_[^\-]*\).*$/\1/g'`
    echo "# $name"
    echo "include \$(CLEAR_VARS)
LOCAL_MODULE := $name
LOCAL_SRC_FILES := $l
include \$(PREBUILT_STATIC_LIBRARY)"
    echo
    echo
done
