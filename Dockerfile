FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/myapp.jar /app/myapp.jar
CMD ["java", "-jar", "myapp.jar"]
