FROM ubuntu:latest
#$PWD only shows the relative path. How can I get full path?
ENV APP_START_PATH /nexus-3.51.0-01/bin
ENV SECRETS_DIR /sonatype-work/nexus3
RUN apt-get update && apt-get -y install sudo curl openjdk-8-jre openjdk-8-jdk \
&& curl -LO https://download.sonatype.com/nexus/3/nexus-3.51.0-01-unix.tar.gz && tar -xvf nexus-3.51.0-01-unix.tar.gz && rm nexus-3.51.0-01-unix.tar.gz \
&& cd $APP_START_PATH && nohup ./nexus run

# Get admin.password file
# RUN admin=$(cd $SECRETS_DIR; awk {print $0})

# COPY nexus.service /etc/systemd/system/nexus.service
# RUN yum -y install sudo && sudo chmod -x /etc/systemd/system/nexus.service && sudo systemctl daemon-reload && systemctl enable nexus.service

# WORKDIR $APP_START_PATH
# CMD ["systemctl","status", "nexus.service"]

ENTRYPOINT [ "/bin/bash" ]
