# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=sysconfig
pkgver=1.0
pkgrel=1
pkgdesc="My system-level configuration files."
arch=(any)
url=""
license=('BSD')
source=("sysconfig.tar")

package() {
  cd "${srcdir}"
  rsync -lr files/ "${pkgdir}"
}

md5sums=('10b27f5fd4d62009fa881820b601b892')
