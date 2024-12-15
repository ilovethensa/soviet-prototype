export vanguard=/home/tht/Projects/vanguard
export sourcedir=$vanguard/sources
export ROOT=$vanguard/root
export TOOLS=$vanguard/tools
export PATH=$PATH:$TOOLS/bin:/usr/bin/
export CARGO="/home/tht/.cargo/bin/cargo"
export CFLAGS="--sysroot=$ROOT -static -Wl,--dynamic-linker=/lib/ld-linux-x86-64.so.2 -fPIC -fPIE -Wno-error -pipe" 
export CONFIGFLAGS="--with-sysroot=$ROOT --prefix=/usr --sbindir=/sbin --enable-static --enable-shared"
export CXXFLAGS=$CFLAGS
export IMG_PATH="$vanguard/image/root.img"