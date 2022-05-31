
ARG ALPINE_VERSION=3.16.0

FROM alpine:$ALPINE_VERSION

ARG FIO_VERSION="3.30-r0"

RUN apk --no-cache add fio=$FIO_VERSION

ENV DBENCH_MOUNTPOINT="/data" \
    FIO_SIZE="2G" \
    FIO_OFFSET_INCREMENT="500M" \
    FIO_DIRECT="1" \
    FIO_RAMP_TIME="2s" \
    FIO_RUNTIME="15s" \
    FIO_IOENGINE="libaio" \
    FIO_IOPS_BS="4K" \
    FIO_IOPS_IODEPTH="64" \
    FIO_BW_BS="128K" \
    FIO_BW_IODEPTH="64" \
    FIO_LATENCY_BS="4K" \
    FIO_LATENCY_IODEPTH="4" \
    FIO_SEQ_BS="1M" \
    FIO_SEQ_IODEPTH="16" \
    FIO_MIX_BS="4K" \
    FIO_MIX_IODEPTH="64" \
    FIO_MIX_RWMIXREAD="75"

COPY benchmark.sh /usr/local/bin/

CMD ["/usr/local/bin/benchmark.sh"]
