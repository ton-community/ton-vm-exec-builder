source /build/emsdk/emsdk_env.sh
make clean
emconfigure ./Configure linux-generic32 no-shared no-dso no-engine no-unit-test no-ui
sed -i 's/CROSS_COMPILE=.*/CROSS_COMPILE=/g' Makefile
sed -i 's/-ldl//g' Makefile
sed -i 's/-O3/-Os/g' Makefile
emmake make depend
emmake make -j4