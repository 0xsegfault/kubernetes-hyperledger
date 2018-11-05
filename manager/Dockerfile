FROM ubuntu AS builder
WORKDIR /app
COPY ./ ./
RUN chmod +x ./setup.sh
RUN ./setup.sh

FROM nginx
COPY --from=builder /app /app