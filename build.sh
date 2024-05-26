#!/bin/sh

PROXYBIN=$1
BINNAME=$2

if [ "$PROXYBIN" = "" ]; then
	echo "Missing argument for PROXYBIN"
	return
fi

if [ "$BINNAME" = "" ]; then
	echo "Missing argument for BINNAME"
	return
fi

# Build the exe
echo "Building $BINNAME which proxies to $PROXYBIN"
nim c -d:release -d:mingw -d:strip \
	--opt=size --mm=orc --threads=on \
	--cpu:amd64 \ --out:"$BINNAME" \
	-d:proxyBin="$PROXYBIN" \
	exeproxy.nim