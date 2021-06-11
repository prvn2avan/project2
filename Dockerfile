FROM tomcat:8.0-alpine

LABEL maintainer=”prvn2avan@gmail.com”

ADD WebAppCal-0.1.2.war /usr/local/tomcat/webapps/

EXPOSE 8085

CMD /usr/local/tomcat/bin/catalina.sh run
