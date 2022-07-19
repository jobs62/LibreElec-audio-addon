PKG_NAME="ladspa"
PKG_VERSION="267852533f7fb681bcda35169534d315055f2d8e"
PKG_REV="100"
PKG_ARCH="any"
PKG_ADDON_PROJECTS="Generic RPi RPi2 RPi4 imx6 WeTek_Hub WeTek_Play_2 Odroid_C2"
PKG_LICENSE="GPL"
PKG_SITE="http://plugin.org.uk"
PKG_URL="https://github.com/swh/ladspa/archive/$PKG_VERSION.zip"
PKG_SOURCE_DIR="$PKG_NAME-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain fftw"
PKG_SECTION="service/system"
PKG_SHORTDESC="Steeve Harri's LADSPA plugin collection"

PKG_AUTORECONF="yes"
PKG_TOOLCHAIN="autotools"
PKG_CONFIGURE_OPTS_TARGET="--disable-nls --disable-rpath"
PKG_IS_ADDON="yes"
PKG_ADDON_NAME="ladspa"
PKG_ADDON_TYPE="xbmc.service.library"
PKG_ADDON_REQUIRES=""
PKG_BUILD_FLAGS="+pic"

configure_target() {
	FFTW_CFLAGS="-I$(get_install_dir fftw)/usr/include" \
	FFTW_LIBS="-L$(get_install_dir fftw)/usr/lib -lfftw3" \
	${PKG_CONFIGURE_SCRIPT} ${TARGET_CONFIGURE_OPTS} ${PKG_CONFIGURE_OPTS_TARGET}
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib/ladspa
  cp -RP $(get_install_dir ladspa)/usr/lib/ladspa/* $ADDON_BUILD/$PKG_ADDON_ID/lib/ladspa
}
