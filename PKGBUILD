
# Maintainer: Chrysostomus @forum.manjaro.org

pkgname=bspwm-scripts
pkgver=0.8
pkgrel=1
pkgdesc="Scripts for controlling bspwm"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=MIT
depends=('dmenu-manjaro'
	'bspwm'
	'sxhkd'
	'xdotool'
	'wmctrl'
	'wmutils'
	'xorg-xdpyinfo'
	'xtitle'
	'xwinfo'
	'xdo')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
	cd "$srcdir"
	install -Dm755 $srcdir/$pkgname/MouseCenter $pkgdir/usr/bin/MouseCenter
	install -Dm755 "$srcdir/$pkgname/99-monitor-hotplug-rules" "$pkgdir/etc/udev/rules.d/99-monitor-hotplug-rules"
	cp -r $srcdir/$pkgname/bin $$pkgname/usr
	chmod a+x $pkgdir/usr/bin/*
}
