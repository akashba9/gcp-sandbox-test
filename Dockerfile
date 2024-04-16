FROM gcr.io/cloud-builders/gcloud
RUN git config --system credential.helper gcloud.sh
VOLUME /tmp
CMD ["gradlew","clean","bootJar","copy"]
COPY app/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
