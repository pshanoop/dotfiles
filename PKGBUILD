# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=sysconfig
pkgver=31.5cbbf4c
pkgrel=1
pkgdesc="My system-level configuration files."
arch=(any)
url=""
license=('BSD')
install=sysconfig.install

pkgver() {
  cd "$srcdir"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/.."
  rsync -plr files/ "$pkgdir"

  chmod 750 "$pkgdir/etc/sudoers.d/"
}
