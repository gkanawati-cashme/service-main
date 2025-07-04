FROM maven:3.9.6-amazoncorretto-21-debian as build

COPY src /app/src
COPY pom.xml /app

WORKDIR /app
RUN mvn clean install

FROM amazoncorretto:21

COPY --from=build /app/target/service-main-1.0.0.jar /app/app.jar

WORKDIR /app

EXPOSE 8888

CMD ["java", "-jar", "app.jar"]
