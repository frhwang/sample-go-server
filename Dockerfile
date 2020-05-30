FROM golang:1.14.3-alpine AS build
WORKDIR /go/src
ADD . /go/src
RUN GOOS=linux go build -o go-server

FROM alpine:latest AS release
COPY --from=build /go/src/go-server /usr/local/bin/
ENTRYPOINT [ "go-server" ]
EXPOSE 3000