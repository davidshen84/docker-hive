FROM openjdk:8-jre
MAINTAINER Xi Shen <davidshen84@gmail.com>

LABEL hive=2.1.0 hadoop=2.7.3 jre=openjdk-8-jre

ADD http://www-us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz /opt
RUN mkdir /opt/hadoop && \
    tar xzf /opt/hadoop-2.7.3.tar.gz --strip-components=1 -C /opt/hadoop && \
    rm /opt/hadoop-2.7.3.tar.gz

ADD http://www-us.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz /opt
RUN mkdir /opt/hive && \
    tar xzf /opt/apache-hive-2.1.0-bin.tar.gz --strip-components=1 -C /opt/hive && \
    rm /opt/apache-hive-2.1.0-bin.tar.gz

COPY opt/ /opt
COPY root/ /root

ENV HADOOP_PREFIX=/opt/hadoop \
    HIVE_HOME=/opt/hive \
    HCATALOG_HOME=/opt/hive/hcatalog \
    TEMPLETON_HOME=/opt/hive/hcatalog
EXPOSE 10000 10002 50111
WORKDIR /opt/hive

ENTRYPOINT ["/root/startup.sh"]
