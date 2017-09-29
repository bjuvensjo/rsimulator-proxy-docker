FROM openjdk:8-jdk

# update dpkg repositories
RUN apt-get update 

# install wget
RUN apt-get install -y wget

# Maven
RUN wget --no-verbose -O /tmp/apache-maven-3.5.0.tar.gz http://apache.mirrors.spacedump.net/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
RUN echo "35c39251d2af99b6624d40d801f6ff02 /tmp/apache-maven-3.5.0.tar.gz" | md5sum -c
RUN tar xzf /tmp/apache-maven-3.5.0.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.5.0 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.5.0.tar.gz
ENV MAVEN_HOME /opt/maven

# Jetty
RUN wget --no-verbose -O /tmp/jetty-distribution-9.4.7.v20170914.tar.gz http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.7.v20170914/jetty-distribution-9.4.7.v20170914.tar.gz
RUN tar xzf /tmp/jetty-distribution-9.4.7.v20170914.tar.gz -C /opt/
RUN rm -f /tmp/jetty-distribution-9.4.7.v20170914.tar.gz
ENV JETTY_HOME /opt/jetty-distribution-9.4.7.v20170914
COPY entry.sh $JETTY_HOME

# Rsimulator
COPY pom.xml /tmp/rsimulator/
COPY src /tmp/rsimulator/src/
WORKDIR /tmp/rsimulator
RUN mvn -Dmaven.repo.local=repo.local package
RUN rm -rf repo.local
RUN mv /tmp/rsimulator/target/rsimulator*.war $JETTY_HOME/webapps/
RUN rm -rf /tmp/rsimulator

ENV RSIMULATOR_HOME /var/rsimulator_home
COPY configuration $JETTY_HOME/resources/

# Rsimulator home directory is a volume, so it can be persisted and survive image upgrades
VOLUME $RSIMULATOR_HOME

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "cd $JETTY_HOME; ./entry.sh"]
