#Red Hat Oficial Image
FROM registry.access.redhat.com/ubi9/ubi:latest

#Lastest version of gogs on https://gogs.io/
ARG GOGS_VERSION="0.12.9"

LABEL name="Gogs - Git Server" \
      vendor="Gogs" \
      io.k8s.display-name="Gogs - Git Server" \
      io.k8s.description="This project is a sample Git Server to be used to test solutions. It's not recommended to production." \
      summary="This project is a sample Git Server to be used to test solutions. It's not recommended to production." \
      io.openshift.expose-services="3000,gogs" \
      io.openshift.tags="gogs" \
      build-date="2022-11-12" \
      version="${GOGS_VERSION}" \
      release="1"

#Install git cmd used by gogs
RUN yum -y install --disablerepo=rhel* git-lfs

#Copy startup script
COPY ./root .

#Creating and configuring workdir
RUN mkdir /home/git
WORKDIR /home/git
ENV HOME=/home/git

#Download and extract gogs application
RUN curl -LO https://dl.gogs.io/${GOGS_VERSION}/gogs_${GOGS_VERSION}_linux_amd64.tar.gz
RUN tar xvzf gogs_${GOGS_VERSION}_linux_amd64.tar.gz
RUN rm gogs_${GOGS_VERSION}_linux_amd64.tar.gz

#Creating the configuration file
RUN mkdir gogs/custom && mkdir gogs/custom/conf && mkdir gogs/custom/default

#fix permissions
RUN chmod -R 777 /home/git
ENV USER_ID=185

EXPOSE 3000

CMD ["/usr/bin/rungogs"]
