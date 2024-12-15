source config.sh
rm -rf $IMG_PATH
mkdir $vanguard/image/root
dd if=/dev/zero of=$IMG_PATH bs=5000M count=1
mkfs.ext4 $IMG_PATH
mount -o loop $IMG_PATH $vanguard/image/root
rsync -a --exclude='/usr/ports' --exclude='/home' --exclude='/var' $ROOT/ $vanguard/image/root/
umount $IMG_PATH
chmod 777 $IMG_PATH