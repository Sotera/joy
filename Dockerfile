FROM ubuntu:18.04

RUN apt update && apt install make gcc libpcap-dev libssl-dev zlib1g-dev -fy
# See https://github.com/cisco/joy/wiki/Building for official.
# Had to add zlib1g-dev to "--enable-gzip" as we want. 

COPY . /workdir

WORKDIR /workdir

RUN ./configure --enable-gzip
# Note you can also/instead --enable-bzip2

RUN make

ENV MAYHEM_CMD_TYPE pcap
ENV LD_LIBRARY_PATH /workdir/lib/.libs

CMD /workdir/bin/.libs/joy @@
