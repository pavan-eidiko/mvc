FROM tomcat:7.0
COPY bin/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
