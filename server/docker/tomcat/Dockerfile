FROM tomcat:10.0

RUN apt-get update && apt-get install -y ant

WORKDIR /root
COPY tomcat tomcat
WORKDIR /root/tomcat

RUN ant -Dj2ee.server.home=/usr/local/tomcat/ -Dlibs.CopyLibs.classpath=copylibs
RUN mv dist/*.war /usr/local/tomcat/webapps/ROOT.war