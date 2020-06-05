FROM libsourcey
RUN rm -rf /webrtc
COPY ./messenger /webrtc/
WORKDIR /webrtc
ENV WEBRTC_POSIX=1
RUN cmake . && make