TERMUX_PKG_HOMEPAGE=http://ant.apache.org/
TERMUX_PKG_DESCRIPTION="Java based build tool like make"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.10.12
TERMUX_PKG_SRCURL=http://apache.mirrors.spacedump.net//ant/binaries/apache-ant-${TERMUX_PKG_VERSION}-bin.tar.bz2
TERMUX_PKG_SHA256=276ea73f267a5b1a58f02e2eb5ef594a9b2885e33afb05ef995251d4d18377a6
TERMUX_PKG_DEPENDS="openjdk-17"
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make_install() {
	mkdir -p $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/opt/ant/bin

	mv ./bin/ant .
	rm -f ./bin/*
	mv ./ant ./bin/
	rm -rf manual
	cp -r ./* $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/opt/ant
	ln -sfr $TERMUX_PREFIX/opt/ant/bin/ant $TERMUX_PKG_MASSAGEDIR/$TERMUX_PREFIX/bin/ant
}
