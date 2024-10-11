# syntax=docker/dockerfile:1
FROM openjdk:18-jdk-slim

# Use apt instead of apk for Debian-based images
RUN apt update && apt upgrade -y && \
    apt install -y --no-install-recommends git

WORKDIR /app
COPY . /app
RUN ./mvnw package
CMD ["java", "-jar", "target/spring-0.0.1-SNAPSHOT.jar"]
EXPOSE 8085
