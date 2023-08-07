#!/bin/bash

ANDROID_SDK_PATH=/home/vladimir/Android/Sdk
ANDROID_NDK_PATH=$ANDROID_SDK_PATH/ndk/25.1.8937393

mkdir lib-armeabi-v7a
cmake -S . -B ./lib-armeabi-v7a \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_PATH/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=armeabi-v7a \
    -DANDROID_NATIVE_API_LEVEL=26 \
    -DOPENSSL_ROOT_DIR=$ANDROID_SDK_PATH/android_openssl/ssl_3 \
    -DOPENSSL_INCLUDE_DIR=$ANDROID_SDK_PATH/android_openssl/ssl_3/include \
    -DOPENSSL_SSL_LIBRARY=$ANDROID_SDK_PATH/android_openssl/ssl_3/armeabi-v7a/libssl.a \
    -DOPENSSL_CRYPTO_LIBRARY=$ANDROID_SDK_PATH/android_openssl/ssl_3/armeabi-v7a/libcrypto.a
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_SHARED_LIBS=ON
cmake --build ./lib-armeabi-v7a
