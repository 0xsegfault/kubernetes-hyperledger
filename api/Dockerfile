FROM golang AS builder
WORKDIR /go/src/github.com/0xsegfault/kubernetes-hyperledger/api
COPY ./ ./
RUN make install
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o bin/api main.go

FROM scratch
COPY --from=builder /go/src/github.com/0xsegfault/kubernetes-hyperledger/api/bin /app
CMD ["/app/api"]