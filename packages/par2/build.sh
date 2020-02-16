TERMUX_PKG_HOMEPAGE=https://github.com/Parchive/par2cmdline
TERMUX_PKG_DESCRIPTION="par2cmdline is a PAR 2.0 compatible file verification and repair tool."
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Oliver Schmidhauser @Neo-Oli"
TERMUX_PKG_VERSION=0.8.1
TERMUX_PKG_SRCURL=https://github.com/Parchive/par2cmdline/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=529f85857ec44e501cd8d95b0c8caf47477d7daa5bfb989e422c800bb71b689a
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_BLACKLISTED_ARCHES="i686"

termux_step_pre_configure() {
	if [ $TERMUX_ARCH = "i686" ]; then
		sed -i 's/LDADD = -lstdc++/LDADD = -lstdc++ -latomic/' $TERMUX_PKG_SRCDIR/Makefile.am
	fi
	aclocal
	automake --add-missing
	autoconf
}
