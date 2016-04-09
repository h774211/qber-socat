FROM ubuntu:14.04

RUN apt-get update && \
    apt-get install -y socat && \
    rm -rf /var/lib/apt/lists/*

ADD /logmein-hamachi-2.1.0.139-x64 /logmein-hamachi-2.1.0.139-x64
RUN bash -l -c "/logmein-hamachi-2.1.0.139-x64/install.sh"
EXPOSE 80
EXPOSE 443
EXPOSE 22
ENV LOACL_HOST ""
ENV REMOTE_HOST ""
CMD socat $LOACL_HOST $REMOTE_HOST
