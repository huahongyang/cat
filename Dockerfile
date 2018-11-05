FROM tomcat:8-jre8-alpine

ADD cat-home/target/*.war $CATALINA_HOME/webapps/cat.war
ADD datasources.xml /data/appdatas/cat/datasources.xml
RUN sed -i "s/port=\"8080\"/port=\"8080\"\ URIEncoding=\"utf-8\"/g" $CATALINA_HOME/conf/server.xml

EXPOSE 8080
CMD ["catalina.sh", "run"]