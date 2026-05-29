#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="gory"
iso_label="GORY_$(date +%Y%m)"
iso_publisher="Gorywiseman <https://github.com/gorywiseman>"
iso_application="Gory Live/Rescue CD"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux' 'uefi.systemd-boot')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd' '-b' '1M')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/install-launchers.sh"]="0:0:755"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/usr/local/bin/apply-gory-theme.sh"]="0:0:755"
  ["/usr/local/bin/gory-installer.py"]="0:0:755"
  ["/root/Desktop/install-gory-os.desktop"]="0:0:755"
  ["/etc/skel/Desktop/install-gory-os.desktop"]="0:0:755"
)
