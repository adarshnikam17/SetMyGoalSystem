FROM tomcat:10.1-jdk17

# remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# copy project
COPY . /usr/local/tomcat/webapps/ROOT/

# compile java files
RUN javac -cp "/usr/local/tomcat/lib/servlet-api.jar:WEB-INF/lib/*" \
    -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes \
    /usr/local/tomcat/webapps/ROOT/src/com/setmygoal/**/*.java

EXPOSE 8080

CMD ["catalina.sh", "run"]