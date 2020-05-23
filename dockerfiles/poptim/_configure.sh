set -x
set -e

echo $CFLAGS
CFLAGS="-O3 -fno-semantic-interposition -march=native -mtune=haswell -mssse3 -ftree-vectorize -fPIC -fPIE -fstack-protector-strong -pipe -I/usr/include/openssl" 
LDFLAGS="$LDFLAGS -fno-semantic-interposition"
FINAL_CXXFLAGS="-march=core2 -mtune=haswell -mssse3 -ftree-vectorize -fPIC -fPIE -fstack-protector-strong -pipe -stdlib=libc++ -fvisibility-inlines-hidden -std=c++14 -fmessage-length=0"

./configure --prefix=/opt/custpyt \
          --with-computed-gotos \
          --enable-optimizations \
          --with-lto \
          --enable-ipv6 \
          --with-dbmliborder=gdbm:ndbm \
          --enable-loadable-sqlite-extensions \
          --with-ensurepip=install

