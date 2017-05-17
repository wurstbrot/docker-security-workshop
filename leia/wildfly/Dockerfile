FROM ubuntu
MAINTAINER Rafael Pestano <rmpestano@gmail.com>

 
# setup WildFly 
COPY wildfly-8.2.0.Final /opt/wildfly

# install example app on wildfy
COPY car-service.war /opt/wildfly/standalone/deployments/


# setup Java

RUN mkdir /opt/java
RUN apt-get update && apt-get install -y default-jdk
RUN java -version

# Expose the ports we're interested in
EXPOSE 8080 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/wildfly/bin/standalone.sh", "-c", "standalone-full.xml", "-b", "0.0.0.0"]
