source config.sh

qemu-system-x86_64 \
    -m 4G \
    -kernel $vanguard/sources/linux-6.12.4/arch/x86/boot/bzImage \
    -append "root=/dev/sda ro init=/usr/lib/systemd/systemd systemd.crash_shell=/usr/bin/brush systemd.volatile=true" \
    -drive file=$IMG_PATH,format=raw,index=0,media=disk
