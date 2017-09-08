
FROM tomcat:8.0-jre8-alpine
LABEL maintainer "guel135@gmail.com"

#Tomcat images expose 8080
COPY $pwd/target/*.war webapps/

