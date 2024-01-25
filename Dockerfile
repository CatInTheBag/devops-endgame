FROM maven:3.8.8-eclipse-temurin-21-alpine AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ ./src/
RUN mvn package -DskipTests

FROM eclipse-temurin:21-alpine
LABEL authors="vassilb"
WORKDIR /app
COPY --from=builder /app/target/myapp-devops-final-project-0.0.1-SNAPSHOT.jar myapp.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]