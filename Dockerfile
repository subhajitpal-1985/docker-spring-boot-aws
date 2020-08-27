FROM maven:3.5.2-jdk-8-alpine
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=0 /build/target/docker-spring-boot-aws-0.0.1-SNAPSHOT.jar /app/
ENTRYPOINT ["java", "-jar", "docker-spring-boot-aws-0.0.1-SNAPSHOT.jar"]