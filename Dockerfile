FROM eclipse-temurin:17-jdk-alpine
ARG PROFILE="qa"
VOLUME /tmp
COPY . .
RUN ["chmod", "+x", "gradlew"]
RUN ["./gradlew","clean","bootJar","-Penv=gcp"]
RUN ["cp","./build/libs/GcpProject-1.0-SNAPSHOT.jar","./app.jar"]
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=${PROFILE}","app.jar"]
