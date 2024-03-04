FROM maven:3.8.1-openjdk-17 as builder

WORKDIR /app

COPY pom.xml ./
COPY /src ./src/

RUN mvn package

FROM openjdk:17-slim
WORKDIR /app
COPY --from=builder /app/target/hello-world-1.0.0.jar .

CMD ["java", "-jar", "/app/hello-world-1.0.0.jar"]