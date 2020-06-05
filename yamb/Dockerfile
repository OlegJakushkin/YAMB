FROM dltc/libsourcey-base:latest

WORKDIR /app

RUN apt-get install -yq libboost-all-dev g++-8

RUN rm /usr/bin/gcc
RUN rm /usr/bin/g++
RUN ln -s /usr/bin/gcc-8 /usr/bin/gcc
RUN ln -s /usr/bin/g++-8 /usr/bin/g++

RUN cp -r /vendor/webrtc-28114-9863f3d-linux-x64 /app

ADD . /app

RUN cp /vendor/libuv/out/cmake/libuv_a.a /app/libuv.a
RUN cp /vendor/webrtc-28114-9863f3d-linux-x64/lib/x64/Debug/libwebrtc_full.a /app/libwebrtc.a

RUN git clone --recurse-submodules https://github.com/sikoba/isekai.git ./isekai

RUN cd ./isekai && apt-get install -y apt-transport-https ca-certificates && apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" && apt-get update && apt-get install -y --allow-unauthenticated  clang-7 libclang-7-dev libprocps-dev libsodium-dev libevent-dev libgmp-dev wget && wget https://github.com/crystal-lang/crystal/releases/download/0.32.1/crystal-0.32.1-1-linux-x86_64.tar.gz && \
tar -xzf crystal-0.32.1-1-linux-x86_64.tar.gz && ln -s /app/isekai/crystal-0.32.1-1/bin/crystal /usr/local/bin/crystal && ln -s /app/isekai/crystal-0.32.1-1/bin/shards /usr/local/bin/shards && \
shards install && cd lib/libsnarc && mkdir build && cd build && cmake .. && make && cd ../../.. && cp docker/bin/libclang.so /usr/lib/x86_64-linux-gnu/libclang-7.so.1 && \
cp docker/bin/libclang.so /usr/lib/libclang.so.7 && make --always-make && cd ..
