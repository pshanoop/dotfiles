# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=sysconfig
pkgver=122.6fddc7a
pkgrel=1
pkgdesc="System-side configuration files and tweaks."
arch=(any)
url="https://gitlab.com/WhyNotHugo/sysconfig"
license=('ISC')
install=sysconfig.install

pkgver() {
  cd "$srcdir"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/.."
  for dir in usr etc boot; do
    rsync -plr $dir "$pkgdir"
  done;

  chmod 750 "$pkgdir/etc/sudoers.d/"
}
