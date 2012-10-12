
include VERSION

myname=idrm
packagepath=..
standalonedir=dcim
packagedest=${HOME}
packagename=${myname}-${version}

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
	-/bin/cp -dv ${myname}* derec lc* *.ini i* LIC* READ* VER* ${standalonedir}/
	cat idrm | sed "s/MYVERSION=\"0.1.0\"/MYVERSION=\"${version}\"/" > ${standalonedir}/idrm
	cat derec | sed "s/MYVERSION=\"0.1.0\"/MYVERSION=\"${version}\"/" > ${standalonedir}/derec
	chmod go-w ${standalonedir}/*
	tar -cvjf ${packagedest}/${packagename}.tbz ${standalonedir}/* --exclude "Makefile"
	zip -u ${packagedest}/${myname}.zip ${packagedest}/${packagename}.tbz 

