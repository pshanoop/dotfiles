package:
	tar cf sysconfig.tar files Makefile
	sed -i '$$ d' PKGBUILD
	makepkg -g >> PKGBUILD
install:
	makepkg -fsci
clean:
	rm -rf src pkg sysconfig*.tar*
