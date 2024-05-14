FROM maven:3.9.6-eclipse-temurin-17-alpine

WORKDIR /workspace/karate-demo
COPY src ./src
COPY pom.xml .

RUN mvn clean test -DskipTests=true
# EXPOSE 4000

CMD ["mvn", "clean", "test", "-Dtest=TestRunner"]