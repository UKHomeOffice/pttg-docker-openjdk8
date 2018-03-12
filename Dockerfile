FROM quay.io/ukhomeofficedigital/openjdk8:v1.8.0.141

ENV USER pttg
ENV GROUP pttg
ENV NAME pttg-openjdk8
ENV JAR_PATH build/libs

ARG VERSION

RUN yum update -y glibc && \
    yum update -y nss && \
    yum update -y bind-license \
    yum update -y openssl

WORKDIR /

RUN groupadd -r ${GROUP} && \
    useradd -r -g ${GROUP} ${USER} -d /

USER ${USER}

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
