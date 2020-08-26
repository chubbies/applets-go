FROM golang:1.13 as build
WORKDIR /go/src/
ADD . .
RUN  unset GOPATH && go build -mod=vendor -o main
FROM ubuntu:18.04
WORKDIR /opt/devops/
COPY --from=build /go/src/main ./main
ENTRYPOINT ["main"]