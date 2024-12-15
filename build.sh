#!/bin/bash
set -e

build_and_install_pkg() {
    local pkg_name="$1"
    local pkg_dir="pkgs/$pkg_name"

    # Navigate to package directory and source Pkgfile
    cd "$pkg_dir"
    source Pkgfile

    # Build the package
    $TOOLS/bin/pkgmk -d -cf $vanguard/config/pkgmk.conf --keep-work

    # Install the package
    $TOOLS/bin/pkgadd -r $ROOT $vanguard/cache/$pkg_name#$version-$release.pkg.tar.gz -f

    # Return to the root directory
    cd "$vanguard"
}

# List of packages to build and install
packages=(
    "linux-headers"
    "glibc"
    "brush"
    "uutils"
    "macchina"
    "zlib"
    "readline"
    "gperf"
    "pkgconf"
    "libcap"
    "libxcrypt"
    "libnsl"
    "libtirpc"
    "linux-pam"
    "libpopt"
    "util-linux"
    "xz"
    "libelf"
    "libbpf"
    "libseccomp"
    "libarchive"
    "kmod"
    "systemd"
    "expat"
    #"dbus"
    "audit"
    "shadow"
)
source config.sh
# Build and install each package using the defined function
for pkg in "${packages[@]}"; do
    build_and_install_pkg $pkg
done

# Post-installation steps
cp scripts/postrun.sh $ROOT
systemd-nspawn -D $ROOT --as-pid2 /bin/brush /postrun.sh
systemd-nspawn -D $ROOT --as-pid2 rm /postrun.sh
