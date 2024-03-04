FROM golang:1.17-alpine3.15 as compiler

RUN mkdir -p /go/app

WORKDIR /go/app

COPY go_project/ .

RUN CGO_ENABLED=1 go build -o /go/app/helloworld .

CMD ["/go/app/./helloworld"]
