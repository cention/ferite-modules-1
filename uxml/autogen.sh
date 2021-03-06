#! /bin/sh

echo
echo 
echo "NOTE:"
echo "you will need libtool 1.3 or higher for this to work"
echo
echo

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

THEDIR="`pwd`"
cd "$srcdir"
DIE=0

libtoolize -c -f
aclocal -I . $ACLOCAL_FLAGS
autoheader
automake -a -c
autoconf

if test -z "$*"; then
        echo "I am going to run ./configure with no arguments - if you wish "
        echo "to pass any to it, please specify them on the $0 command line."
fi

cd "$THEDIR"

$srcdir/configure "$@"

set +x

echo "Now type:"
echo
echo "make"
echo "make install"
echo
echo "have fun."

