# Use Maven to build the WAR file
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Deploy to Tomcat
FROM tomcat:9.0-jdk17
WORKDIR /usr/local/tomcat
RUN rm -rf webapps/*
COPY --from=build /app/target/EmployeeManagement.war webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
