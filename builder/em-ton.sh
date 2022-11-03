set -e

source /build/emsdk/emsdk_env.sh
ZLIB_DIR=/build/zlib
OPENSSL_DIR=/build/openssl
EMSDK_DIR=/build/emsdk
emcmake cmake -DUSE_EMSCRIPTEN=ON -DCMAKE_BUILD_TYPE=Release -DZLIB_LIBRARY=$ZLIB_DIR/libz.a -DZLIB_INCLUDE_DIR=$ZLIB_DIR -DOPENSSL_ROOT_DIR=$OPENSSL_DIR -DOPENSSL_INCLUDE_DIR=$OPENSSL_DIR/include -DOPENSSL_CRYPTO_LIBRARY=$OPENSSL_DIR/libcrypto.a -DOPENSSL_SSL_LIBRARY=$OPENSSL_DIR/libssl.a -DCMAKE_TOOLCHAIN_FILE=$EMSDK_DIR/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake -DCMAKE_CXX_FLAGS="-sUSE_ZLIB=1" ..
emmake make -j4 vm-exec
cp crypto/vm-exec.wasm crypto/vm-exec.js /output