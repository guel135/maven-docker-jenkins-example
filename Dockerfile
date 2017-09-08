
FROM tomcat
LABEL maintainer "guel135@gmail.com"

#Tomcat images expose 8080
COPY $pwd/*.war webapps/

CMD ["catalina.sh", "run"]

