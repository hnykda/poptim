set -x
set -e

CFLAGS="-O3 -fno-semantic-interposition -march=native -mtune=haswell -mssse3 -ftree-vectorize -fPIC -fPIE -fstack-protector-strong -pipe"
LDFLAGS="$LDFLAGS -fno-semantic-interposition"
FINAL_CXXFLAGS="-march=core2 -mtune=haswell -mssse3 -ftree-vectorize -fPIC -fPIE -fstack-protector-strong -pipe -stdlib=libc++ -fvisibility-inlines-hidden -std=c++14 -fmessage-length=0"

make install
