FROM openjdk:8-jre
MAINTAINER Xi Shen <davidshen84@gmail.com>

LABEL hive=2.1.0 hadoop=2.7.3 jre=openjdk:8

ADD http://www-us.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz /opt
ADD http://www-us.apache.org/dist/hive/hive-2.1.0/apache-hive-2.1.0-bin.tar.gz /opt
RUN tar xzf /opt/hadoop-2.7.3.tar.gz -C /opt && \
    rm /opt/hadoop-2.7.3.tar.gz && \
    tar xzf /opt/apache-hive-2.1.0-bin.tar.gz -C /opt && \
    rm /opt/apache-hive-2.1.0-bin.tar.gz

COPY opt /opt
COPY startup.sh /root/

ENV HADOOP_HOME=/opt/hadoop-2.7.3
EXPOSE 10000 10002
WORKDIR /opt/apache-hive-2.1.0-bin

ENTRYPOINT ["/root/startup.sh"]
