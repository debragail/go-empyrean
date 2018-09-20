FROM golang:1.10.3-alpine as builder

LABEL "priom"="priom@chainsafe.io"
LABEL version="0.1"

COPY ./ /go/src/github.com/ShyftEthereum/go-empyrean
WORKDIR /go/src/github.com/ShyftEthereum/go-empyrean
ADD . /go/src/github.com/ShyftEthereum/go-empyrean

RUN \
  apk add --update git make gcc musl-dev linux-headers ca-certificates && \
  (cd /go/src/github.com/ShyftEthereum/go-empyrean && make geth && make bootnode)


FROM scratch as prod

COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/shyft-cli/initShyftGeth.sh /go/src/github.com/ShyftEthereum/go-empyrean/
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/shyft-cli/startShyftGeth.sh /go/src/github.com/ShyftEthereum/go-empyrean/
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/unlockPasswords.txt /go/src/github.com/ShyftEthereum/go-empyrean
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/wait-for.sh /go/src/github.com/ShyftEthereum/go-empyrean/
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/ShyftNetwork.json /go/src/github.com/ShyftEthereum/go-empyrean/
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/config.toml /go/src/github.com/ShyftEthereum/go-empyrean/
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/build/bin/geth /go/src/github.com/ShyftEthereum/go-empyrean/build/bin/geth
COPY --from=builder /go/src/github.com/ShyftEthereum/go-empyrean/build/bin/bootnode /go/src/github.com/ShyftEthereum/go-empyrean/build/bin/bootnode

WORKDIR /go/src/github.com/ShyftEthereum/go-empyrean
RUN ls -la

ENTRYPOINT ["/go/src/github.com/ShyftEthereum/go-empyrean"]

CMD ["./initShyftGeth.sh", "./startShyftGeth.sh"]