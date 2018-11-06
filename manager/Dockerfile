FROM node:alpine AS builder
WORKDIR /app
COPY ./ ./
RUN chmod +x ./setup.sh
RUN ./setup.sh

FROM nginx
# Only useful for elasticbeanstalk
EXPOSE 80
COPY --from=builder /app /app
RUN mkdir -p /storage
COPY /app /storage