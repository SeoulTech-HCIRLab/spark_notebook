# this DockerFile was made for education.
# [Course of Big Data Analysis]

# install ubuntu 18.04
FROM ubuntu:18.04
MAINTAINER Seoultech_HCIR_LAB(titania7777@gmail.com)
RUN apt-get -yqq update && \
    apt-get -yqq install openssh-server && \
    apt-get -yqq install ssh && \
    apt-get -yqq install rsync && \
    apt-get -yqq install python3.6 && \
    apt-get -yqq install python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# setup passphraseless ssh
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys && \
    echo "Host *" > ~/.ssh/config && \
    echo " StrictHostKeyChecking no" >> ~/.ssh/config

# install python3 and jupyter
RUN pip install jupyter && \
    pip install spylon_kernel && \
    python -m spylon_kernel install

# set working direectory
WORKDIR /root

# copy (jdk, hadoop, spark)
ADD ./workdir/jdk-8.tar ./
ADD ./workdir/hadoop-3.2.1.tar ./
ADD ./workdir/spark-3.0.0-bin-hadoop3.2.tar ./
ADD ./workdir/Data.tar ./
COPY ./spark3/start.sh ./

# set environment variables
ENV JAVA_HOME=/root/jdk-8
ENV HADOOP_HOME=/root/hadoop-3.2.1
ENV SPARK_HOME=/root/spark-3.0.0-bin-hadoop3.2
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native
ENV SPARK_OPTS="--driver-java-options=-Xms1024M --driver-java-options=-Xmx4096M --driver-java-options=-Dlog4j.logLevel=info"
ENV PATH=$JAVA_HOME/bin:$PATH
ENV PATH=$HADOOP_HOME/bin:$PATH
ENV PATH=$SPARK_HOME/bin:$PATH

ENV HDFS_NAMENODE_USER="root"
ENV HDFS_DATANODE_USER="root"
ENV HDFS_SECONDARYNAMENODE_USER="root"
# ENV YARN_RESOURCEMANAGER_USER="root"
# ENV YARN_NODEMANAGER_USER="root"

# format hdfs
RUN hdfs namenode -format && \
    service ssh start && \
    $HADOOP_HOME/sbin/start-dfs.sh && \
    hdfs dfs -mkdir /Data && \
    hdfs dfs -put ./Data/* /Data && \
    $HADOOP_HOME/sbin/stop-dfs.sh

# expose ports
EXPOSE 8888
EXPOSE 8088
EXPOSE 8080
EXPOSE 4040
EXPOSE 50070

# set working direectory
RUN mkdir workspace
WORKDIR /root/workspace

# start jupyter
CMD . ../start.sh