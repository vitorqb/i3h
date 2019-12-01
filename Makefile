VERSION=0.0.2

compress:
	$(eval tmpdir := $(shell mktemp -d))
	$(eval desdir := ${tmpdir}/i3h-${VERSION})
	$(eval tarfil := ${tmpdir}/${VERSION}.tar.gz)
	ls ./i3h/ | xargs -I '{}' -- install -D "./i3h/{}" "${desdir}/i3h/{}"
	ls ./lib/ | xargs -I '{}' -- install -D "./lib/{}" "${desdir}/lib/{}"
	cd ${tmpdir} && tar -vzcf ${tarfil} i3h-${VERSION}
	cp ${tarfil} ./
	rm -rf ${tmpdir}
