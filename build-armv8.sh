#!/bin/bash

# ===== Clean previous build =====
make distclean 2>/dev/null || echo "skip clean"

rm -f config.status

# ===== Generate configure =====
./autogen.sh || echo "autogen done"

# ===== Configure =====
CFLAGS="-O2 -march=armv8-a+crypto+sha2+aes -Wall -flax-vector-conversions" \
./configure --with-curl

# ===== Build with 2 threads only =====
make -j2

# ===== Optional strip (smaller binary) =====
# strip -s cpuminer
