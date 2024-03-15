#!/bin/sh

if [ "$1" = "" ]; then
	echo "Missing argument for BINPATH"
	return
fi

# Super hacky way of escaping the backslashes in the binary's path
BINPATH=$(echo "$1" | sed 's,\\,\\\\,g' | sed 's,\\,\\\\,g')

# Name for the output .exe file
BINNAME="$(echo "$BINPATH" | awk -F "\\" '{print $NF}')"
echo "Building $BINNAME ($BINPATH)"

# Replace the template string inside the nim file
sed "s/{{BINPATH}}/$BINPATH/" exeproxy.nim > /tmp/exeproxy.nim

# Build the exe
nim c -d:release -d:mingw -d:strip \
	--opt=size --mm=orc --threads=on \
	--cpu:amd64 \
	--out:"$BINNAME" --outdir="." \
	/tmp/exeproxy.nim