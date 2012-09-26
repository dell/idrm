
include VERSION

myname=idrm
packagepath=..
standalonedir=dcim

all: help

help:
	@echo ""
	@echo "  distclean          - Remove files and directories created by make"
	@echo "  standalonepack     - Create a stand alone tar package"
	@echo ""
	@false

distclean: standalonepackclean
	-/bin/rm response*xml request*.xml log.txt >/dev/null 2>&1 || true

standalonepackclean:
	-/bin/rm -rf ${standalonedir} >/dev/null 2>&1

standalonepack: standalonepackclean
	-/bin/mkdir ${standalonedir}
	-/bin/cp -dv ${myname}* iconfig* ireport* LIC* READ* VER* ${standalonedir}/
	chmod go-w ${standalonedir}/*
	tar -cvjf ${packagepath}/${myname}-${version}.tbz ${standalonedir}/* --exclude "Makefile"
	zip -u ${packagepath}/${myname}.zip ${packagepath}/${myname}-${version}.tbz 

