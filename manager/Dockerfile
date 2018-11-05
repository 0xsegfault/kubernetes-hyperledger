FROM nginx

WORKDIR /app
RUN mkdir -p /app/bin
COPY . .

# RUN /app/bin/cryptogen generate --config /app/crypto-config.yaml