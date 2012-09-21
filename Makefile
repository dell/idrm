
include VERSION

myname=idrm
packagepath=../..

all: packageit

clean:
	-/bin/rm response*xml request*.xml log.txt
	-/bin/rm -rf dcim

packageit: clean
	mkdir dcim 
	cp -fpv * dcim  || true 
	chmod a-w dcim/* 
	tar -cvjf ${packagepath}/${myname}-${version}.tbz dcim/* --exclude "Makefile"
	zip -u ${packagepath}/${myname}.zip ${packagepath}/${myname}-${version}.tbz 
	/bin/rm -rf dcim

