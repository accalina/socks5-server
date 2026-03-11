FROM golang:alpine3.23 AS builder
RUN apk --no-cache add tzdata
WORKDIR /go/src/github.com/accalina/socks5
COPY . .

# # Download and install UPX 5.1.0
RUN wget -q https://github.com/upx/upx/releases/download/v5.1.0/upx-5.1.0-amd64_linux.tar.xz \
    && tar -xf upx-5.1.0-amd64_linux.tar.xz \
    && mv upx-5.1.0-amd64_linux/upx /usr/local/bin/upx \
    && chmod +x /usr/local/bin/upx \
    && rm -rf upx-5.1.0-amd64_linux*

ENV GO111MODULE=on CGO_ENABLED=0 GOOS=linux GOARCH=amd64
# RUN go build -a -gcflags=all="-l -B" -ldflags "-s -w" -o ./socks5 main.go
RUN go build -a -installsuffix cgo -gcflags=all="-l -B" -ldflags '-s -w' -o ./socks5
RUN upx --ultra-brute --lzma ./socks5

# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-s' -o ./socks5

FROM gcr.io/distroless/static:latest AS runtimestage
COPY --from=builder /go/src/github.com/accalina/socks5/socks5 /
ENTRYPOINT ["/socks5"]
