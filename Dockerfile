FROM registry.cn-hangzhou.aliyuncs.com/leo_library/golang:1.13.10 as build
WORKDIR /go/src/
ADD . .
RUN  unset GOPATH && go build -mod=vendor -o main
FROM registry.cn-hangzhou.aliyuncs.com/leo_library/openjdk:8-jdk-cnzone-with-systool
WORKDIR /opt/devops/
COPY --from=build /go/src/main ./main
ENTRYPOINT ["main"]