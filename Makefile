package:
	tar cf sysconfig.tar files Makefile
	cat PKGBUILD.proto > PKGBUILD
	makepkg -g >> PKGBUILD
	makepkg -fs
install:
	pacman -U --force sysconfig-*-any.pkg.tar.xz
clean:
	rm -rf src pkg sysconfig*.tar* PKGBUILD
