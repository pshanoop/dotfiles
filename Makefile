package:
	tar cf sysconfig.tar files Makefile
	cat PKGBUILD.proto > PKGBUILD
	makepkg -g >> PKGBUILD
	makepkg -fs
install:
	makepkg -i
clean:
	rm -rf src pkg sysconfig*.tar* PKGBUILD
