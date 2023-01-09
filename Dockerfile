ARG GO_VERSION=1.19
FROM golang:${GO_VERSION}-alpine AS build

WORKDIR /app

COPY ./ ./

RUN CGO_ENABLED=0 go build -o /sample-app


FROM gcr.io/distroless/static

WORKDIR /
USER nonroot:nonroot

COPY --from=build --chown=nonroot:nonroot /sample-app /sample-app

EXPOSE 8080

ENTRYPOINT ["/sample-app"]
