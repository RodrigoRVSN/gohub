# Stage 1
FROM golang:1.20-bullseye as builder

WORKDIR /usr/src

COPY main.go ./

RUN go build main.go

# Stage 2
FROM scratch
COPY --from=builder /usr/src ./

CMD ["./main"]