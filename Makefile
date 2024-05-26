IMGNAME="nimexeproxy"
PROXYBIN=""
BINNAME=""

make: indocker

image:
	docker build --build-arg userid=${shell id -u} -t ${IMGNAME} .

indocker: image
	rm -rf *.exe
	docker run --rm -v ${PWD}:/src ${IMGNAME} '${PROXYBIN}' '${BINNAME}'

local:
	rm -rf *.exe
	/bin/sh build.sh '${PROXYBIN}' '${BINNAME}'

cleanup:
	rm -rf *.exe
	docker image rm ${IMGNAME}