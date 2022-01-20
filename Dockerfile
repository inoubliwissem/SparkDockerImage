# specifiy the image ' OS
FROM ubuntu:18.04
MAINTAINER Wissem Inoubli (inoubliwissem@gmail.com)
# install the required softwares (JDK, openssh, wget)

RUN apt-get update -y  && apt-get install wget -y && apt-get install ssh -y && apt-get install openjdk-8-jdk -y && apt-get install sudo -y && apt-get install scala -y

# create a new user and add it as sudoer
RUN useradd -m spark && echo "spark:supergroup" | chpasswd && adduser spark sudo && echo "spark     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && cd /usr/bin/ &&  ln -s python3 python
# set the workspace
WORKDIR /home/spark



# switech to the created user

USER spark

# download spark and extract it


RUN wget https://dlcdn.apache.org/spark/spark-3.2.0/spark-3.2.0-bin-hadoop3.2.tgz && tar zxvf spark-3.2.0-bin-hadoop3.2.tgz && rm spark-3.2.0-bin-hadoop3.2.tgz


RUN mv spark-3.2.0-bin-hadoop3.2 spark

# share the public key
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && chmod 0600 ~/.ssh/authorized_keys

# set environment variable

ENV SPARK_HOME=/home/spark/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

COPY ssh_config /etc/ssh/ssh_config



#open the used ports
EXPOSE 7077 8080 22
 
