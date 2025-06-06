#!/usr/bin/env bash

cat >/ISO/isolinux/ks.cfg <<'EOF'
#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
#ignoredisk --only-use=sda
 
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang zh_CN.UTF-8 keyboard cn
 
# Network information
network --bootproto=dhcp --device=eth0 --onboot=on
 
# Root password
rootpw --iscrypted $6$8F67kBk5cTYinHqt$oXvuxgzIwCCfMDa19MIM97D19SByEj3Dg2iRxo4iJ3JAWU3rQMh/P/4lgyz0lj8kR9DHnvdMuVckzu6RX2JHs.
# System services
services --disabled="chronyd"
# System timezone
timezone Asia/Shanghai --utc
# System bootloader configuration
bootloader --location=mbr --append="crashkernel=auto rhgb quiet"
# Partition clearing information
clearpart --none --initlabel
# Disk partitioning information
part pv.156 --fstype="lvmpv" --ondisk=sda --size=9215
part /boot --fstype="xfs" --ondisk=sda --size=1024
volgroup centos --pesize=4096 pv.156
logvol /  --fstype="xfs" --grow --maxsize=51200 --size=1024 --name=root --vgname=centos
logvol swap  --fstype="swap" --size=1023 --name=swap --vgname=centos
 
zerombr clearpart --all --drives=sda ignoredisk --only-use=sda

autopart --type=plain

%packages
@^minimal
@core
kexec-tools
%end
 
%addon com_redhat_kdump --enable --reserve-mb='auto'
 
%end
 
%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
 
%post --nochroot
cp /run/install/repo/Packages/backup.tar.gz /mnt/sysimage/
chmod +x /mnt/sysimage/etc/rc.d/rc.local
echo "cd / && tar xpfz backup.tar.gz -C /  && rm -f /backup.tar.gz && rm -f /etc/sysconfig/network-scripts/ifcfg-ens192 && reboot " >>  /mnt/sysimage/etc/rc.d/rc.local
%end
EOF
