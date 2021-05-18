# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=whynothugo-desktop
pkgver=159.846f021
pkgrel=1
pkgdesc="Metapackage for WhyNotHugo's desktop."
arch=('any')
url="https://gitlab.com/WhyNotHugo/sysconfig"
license=('ISC')
install=sysconfig.install
replaces=("sysconfig")
conflicts=("sysconfig")
provides=(
  awesome-terminal-fonts  # lsd depends on this but breaks if it's installed.
)
depends=(
  # System ====================================================================
  # The very basics
  base
  downgrade
  linux
  linux-firmware
  linux-headers
  meta-group-base-devel
  nss-mdns
  paru

  # Hardware support ==========================================================
  kernel-modules-hook
  openrazer-meta-git  # Properly handles DPI for Razer mice.
  pam-u2f  # Required to sudo with the yubikey.
  razercommander
  solaar  # Used to reconfigure unifying receivers.

  # Fonts =====================================================================
  noto-fonts
  noto-fonts-cjk
  otf-font-awesome  # waybar
  otf-operator-mono-nerd  # terminal
  ttf-opensans # XXX: waybar?
  ttf-twemoji
  ttf-ubuntu-font-family # XXX: gtk?

  # Desktop support ===========================================================
  # Packages that are required for desktop functionality but not used by me
  # directly.
  darkman
  gammastep
  mako-git
  ponymix # use for volume scripts
  swayidle
  swaylock
  systemd-lock-handler
  waybar
  waylock # XXX: not used!
  wev
  wl-clipboard
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr
  xorg-xwayland
  xorg-xwayland

  # Desktop applications ======================================================
  alacritty
  blueman-git
  nemo
  nemo-fileroller
  network-manager-applet
  pavucontrol-git
  seahorse
  shotman
  sway
  sway-launcher-desktop
  tor-browser
  wdisplays-git
  wf-recorder-git
  xorg-xeyes

  # Shell utilities ===========================================================
  drm_info-git
  khal
  lsd  # colourful `ls` with icons.
  perl-file-mimeinfo  # mimetype, mimeopen
  perl-image-exiftool  # exiftool
  restic
  rsync
  todoman
  usbutils  # lsusb
  vdirsyncer

  # Shell =====================================================================
  emoji-cli
  starship
  zsh
  zsh-completions
  zsh-doc
  zsh-syntax-highlighting

  # Development ===============================================================
  amazon-ecr-credential-helper
  aws-cli
  aws-session-manager-plugin
  aws-vault
  awslogs
  docker-compose
  docker-credential-secretservice
  docker-rootless-extras
  fzf
  git-crypt
  go
  insomnia-bin  # XXX: Is there a flatpak?
  nvm
  openssh
  pkgbuild-introspection
  python-black
  python-ipdb  # use for quick tests
  python-pipenv
  python-pre-commit
  python-tox-poetry
  pyupgrade
  rustup
  terraform
  the_silver_searcher

  # Neovim ====================================================================
  # Neovim itself and any tools it uses.
  # Most of these are only used through neovim and never directly.
  bash-language-server
  efm-langserver
  efm-langserver
  eslint  # XXX: Shouldn't this be used via node_modules?
  eslint-plugin-vue  # XXX: Shouldn't this be used via node_modules?
  gopls
  jedi-language-server
  lua-language-server
  neovim-git
  nodejs-vls
  prettier
  python-flake8-bugbear
  python-flake8-comprehensions
  python-flake8-efm
  python-flake8-import-order
  python-language-server
  python-reorder-python-imports
  rust-analyzer
  terraform-ls
  typescript-language-server
  vue-cli  # XXX: Shouldn't this be used via node_modules?
)

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

# vim: colorcolumn=35,80
