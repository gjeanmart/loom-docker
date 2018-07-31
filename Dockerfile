FROM ethereum/solc:stable AS solc
FROM golang:1.10.3 AS build

MAINTAINER Gregoire Jeanmart version: 0.1


####################################################################################################################
# Ubuntu Packages
RUN apt-get update && apt-get install -y curl unzip make git && apt-get clean && rm -rf /var/lib/apt/lists/*


####################################################################################################################
# Ethereum Solc
COPY --from=solc /usr/bin/solc /usr/bin/solc


####################################################################################################################
# Protobuf
ENV PROTOBUF_VERSION=3.5.1

RUN curl -OL https://github.com/google/protobuf/releases/download/v${PROTOBUF_VERSION}/protoc-${PROTOBUF_VERSION}-linux-x86_64.zip && \
    unzip protoc-${PROTOBUF_VERSION}-linux-x86_64.zip -d /usr/local && \
    chmod +x /usr/local/bin/protoc


####################################################################################################################
# Installation
ENV LOOM_VERSION=build-330

RUN mkdir /loom && \ 
	cd /loom && \ 
	curl -OL https://private.delegatecall.com/loom/linux/${LOOM_VERSION}/loom && \ 
	chmod +x loom


####################################################################################################################
# Copy scripts and set permissions
COPY ./scripts /scripts
RUN chmod +x /scripts/run.sh


####################################################################################################################
# Run
EXPOSE 46656 46657 46658 9999

WORKDIR /loom

CMD ["/scripts/run.sh"]


