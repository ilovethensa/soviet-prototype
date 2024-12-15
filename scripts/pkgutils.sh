if [ ! "$(PATH=$TOOLS/bin command -v pkgmk)" ]; then
		if [ ! -f $sourcedir/pkgutils-5.40.10.tar.xz ]; then
			curl -o $sourcedir/pkgutils-5.40.10.tar.xz https://crux.nu/files/pkgutils-5.40.10.tar.xz
		fi
		rm -rf /tmp/pkgutils-5.40.10
		tar -xf $sourcedir/pkgutils-5.40.10.tar.xz -C /tmp
		sed -i -e 's/ --static//' -e 's/ -static//' /tmp/pkgutils-5.40.10/Makefile
		CFLAGS="-O2" CXXFLAGS=$CFLAGS make -j$(nproc) -C /tmp/pkgutils-5.40.10
		CFLAGS="-O2" CXXFLAGS=$CFLAGS make -j$(nproc) -C /tmp/pkgutils-5.40.10 BINDIR=$TOOLS/bin MANDIR=$TOOLS/man ETCDIR=$TOOLS/etc install
		rm -rf /tmp/pkgutils-5.40.10
	fi