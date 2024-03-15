IMGNAME="nimexeproxy"
BINPATH=""

make: indocker

image:
	docker build --build-arg userid=${shell id -u} -t ${IMGNAME} .

indocker: image
	rm -rf *.exe
	docker run --rm -v ${PWD}:/src ${IMGNAME} ${BINPATH}

local:
	rm -rf *.exe
	/bin/sh build.sh ${BINPATH}

cleanup:
	rm -rf *.exe
	docker image rm ${IMGNAME}