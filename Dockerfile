FROM tomcat:10.1-jdk17

# remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# copy project
COPY . /usr/local/tomcat/webapps/ROOT

WORKDIR /usr/local/tomcat/webapps/ROOT

# create classes folder
RUN mkdir -p WEB-INF/classes

# compile all java files
RUN find src -name "*.java" > sources.txt && \
    javac -cp "/usr/local/tomcat/lib/servlet-api.jar:WEB-INF/lib/*" \
    -d WEB-INF/classes @sources.txt

EXPOSE 8080

CMD ["catalina.sh", "run"]