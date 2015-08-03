# Contributor: Chrysostomus


pkgname=Bspwm-scripts
_pkgname=Bspwm-scripts
pkgver=0.1
pkgrel=1
pkgdesc="Panel script for bspwm using patched dmenu and lemonbar"
arch=(any)
url="https://github.com/Chrysostomus/Bspwm-scripts"
license=("MIT")
depends=('dmenu-manjaro' 'bspwm' 'sxhkd' 'xdotool' 'wmctrl' 'wmutils-git' 'xorg-xdpyinfo' 'xtitle')
optdepends=()
makedepends=("git")
l=$_pkgname.install
source=(git://github.com/Chrysostomus/Bspwm-scripts)
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}


# vim:set ts=2 sw=2 et:
package () {
    cd "$srcdir"
    install -d -m755 "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/MouseCenter" "$pkgdir/usr/bin/MouseCenter"
	install -m755 "$srcdir/$pkgname/MouseLaunch" "$pkgdir/usr/bin/MouseLaunch"
	install -m755 "$srcdir/$pkgname/WindowSelector" "$pkgdir/usr/bin/WindowSelector"
	install -m755 "$srcdir/$pkgname/swapOrMoveIn.sh" "$pkgdir/usr/bin/swapOrMoveIn.sh"
	install -m755 "$srcdir/$pkgname/autogap" "$pkgdir/usr/bin/autogap"
	install -m755 "$srcdir/$pkgname/automonocle" "$pkgdir/usr/bin/automonocle"
	install -m755 "$srcdir/$pkgname/application_switcher" "$pkgdir/usr/bin/application_switcher"
	install -m755 "$srcdir/$pkgname/auto-presel" "$pkgdir/usr/bin/auto-presel"
	install -m755 "$srcdir/$pkgname/bspcp" "$pkgdir/usr/bin/bspcp"
	install -m755 "$srcdir/$pkgname/bspwm_move.sh" "$pkgdir/usr/bin/bspwm_move.sh"
	install -m755 "$srcdir/$pkgname/bspwm_rename_desktop" "$pkgdir/usr/bin/bspwm_rename_desktop"
	install -m755 "$srcdir/$pkgname/bspwm_resize.sh" "$pkgdir/usr/bin/bspwm_resize.sh"
	install -m755 "$srcdir/$pkgname/dboxmenu" "$pkgdir/usr/bin/dboxmenu"
	install -m755 "$srcdir/$pkgname/dboxrun" "$pkgdir/usr/bin/dboxrun"
	install -m755 "$srcdir/$pkgname/get-window-alignment" "$pkgdir/usr/bin/get-window-alignment"
	install -m755 "$srcdir/$pkgname/toggle-pointer-follows-focus" "$pkgdir/usr/bin/toggle-pointer-follows-focus"	
	install -m755 "$srcdir/$pkgname/toggle-focus-follows-pointer" "$pkgdir/usr/bin/toggle-focus-follows-pointer"
	install -m755 "$srcdir/$pkgname/whid" "$pkgdir/usr/bin/whid"
	install -m755 "$srcdir/$pkgname/workspaces_multimonitor" "$pkgdir/usr/bin/workspaces_multimonitor"
	install -m755 "$srcdir/$pkgname/clickpasser2.sh" "$pkgdir/usr/bin/clickpasser2.sh"	
	install -m755 "$srcdir/$pkgname/clickpasser3.sh" "$pkgdir/usr/bin/clickpasser3.sh"
	install -m755 "$srcdir/$pkgname/dmenu_recent" "$pkgdir/usr/bin/dmenu_recent"
	install -m755 "$srcdir/$pkgname/finder" "$pkgdir/usr/bin/finder"
}
