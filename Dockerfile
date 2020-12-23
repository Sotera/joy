FROM ubuntu:18.04

RUN apt update && apt install make gcc libpcap-dev libssl-dev -fy

COPY . /workdir

WORKDIR /workdir

RUN ./configure

RUN make

ENV MAYHEM_CMD_TYPE pcap
ENV LD_LIBRARY_PATH /workdir/lib/.libs

CMD /workdir/bin/.libs/joy @@
