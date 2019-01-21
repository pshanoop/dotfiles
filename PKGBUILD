# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=sysconfig
pkgver=31.5cbbf4c
pkgrel=1
pkgdesc="My system-level configuration files."
makedepends=(rust)
arch=(any)
url=""
license=('BSD')
install=sysconfig.install

pkgver() {
  cd "$srcdir"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/.."
  rustc sources/detect-egpu.rs -o files/usr/bin/detect-egpu
  chmod +s files/usr/bin/detect-egpu
}

package() {
  cd "$srcdir/.."
  rsync -plr files/ "$pkgdir"

  chmod 750 "$pkgdir/etc/sudoers.d/"
}
