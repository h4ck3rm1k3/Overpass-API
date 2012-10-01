pushd src
autoscan
aclocal
autoheader
libtoolize
automake --add-missing
autoconf

popd