#!/usr/bin/env bash
#
# From: https://wiki.archlinux.org/index.php/Dracut#Generate_a_new_initramfs_on_kernel_upgrade

args=('--force' '--no-hostonly-cmdline')

while read -r line; do
  if [[ "$line" == 'usr/lib/modules/'+([^/])'/pkgbase' ]]; then
    read -r pkgbase < "/${line}"
    kver="${line#'usr/lib/modules/'}"
    kver="${kver%'/pkgbase'}"

    # Use a non-default paths since this is still experimental:
    install -Dm0644 "/${line%'/pkgbase'}/vmlinuz" "/boot/vmlinuz-dracut"
    dracut "${args[@]}" --hostonly "/boot/initramfs-dracut.img" --kver "$kver"
    dracut "${args[@]}" --no-hostonly "/boot/initramfs-dracut-fallback.img" --kver "$kver"
  fi
done
