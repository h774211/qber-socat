FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y socat && \
    rm -rf /var/lib/apt/lists/*

ADD /logmein-hamachi-2.1.0.139-x64 /logmein-hamachi-2.1.0.139-x64
RUN cd /logmein-hamachi-2.1.0.139-x64
RUN ./install.sh
CMD ["/bin/bash"]
