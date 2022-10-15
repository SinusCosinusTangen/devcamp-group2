FROM --platform=linux/arm64 golang:1.18 AS build

ENV GO111MODULE=on

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

WORKDIR /go/src/didaur-tokopedia/

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o main .

FROM alpine
COPY --from=build /go/src/didaur-tokopedia/main go/bin/didaur-tokopedia/

EXPOSE 8000
WORKDIR go/bin/didaur-tokopedia/

CMD ["./main"]