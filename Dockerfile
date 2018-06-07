# Docker for java

# Base iamges

FROM centos

#Base Pkg
RUN rpm -ivh https://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm

#For JDk

RUN yum install -y supervisor openssh-clients openssl-devel openssh-server java-1.8.0-openjdk java-1.8.0-openjdk-devel wget tree net-tools && \

    yum clean all

#ENV
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

#tomcat

ADD apache-tomcat-8.5.31.tar.gz /usr/local/
RUN ln -s /usr/local/apache-tomcat-8.5.31/ /usr/local/tomcat
ADD tomcat.ini /etc/supervisord.d/tomcat.ini
ENV TOMCAT_HOME /usr/local/tomcat
#supervisor
ADD supervisord.conf /etc/supervisord.conf
#SSHD
EXPOSE 22

#CMD
CMD /usr/bin/supervisord -c /etc/supervisord.conf

 
