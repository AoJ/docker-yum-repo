FROM centos:7.4.1708
MAINTAINER AooJ <aooj@n13.cz>

# ENV FAKE_SYSTEMCTL=https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/b9b2c8ecf8a5d2b986060fc1592055e75b84a6b8/files/docker/systemctl.py
# RUN curl -o /usr/bin/systemctl ${FAKE_SYSTEMCTL}                                    && \
#    chmod 0755 /usr/bin/systemctl


ARG MARIADB_ARCH=centos7-amd64
ARG MARIADB_VERSION=10.1
ENV MARIADB_VERSION=$MARIADB_VERSION
ENV MARIADB_ARCH=$MARIADB_ARCH

ENV GPG_KEY=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

RUN echo -e "[MariaDB]                                                                  \n\
name = MariaDB                                                                          \n\
description = MariaDB ${MARIADB_VERSION}                                                \n\
baseurl = http://yum.mariadb.org/${MARIADB_VERSION}/${MARIADB_ARCH}                     \n\
gpgkey=${GPG_KEY}                                                                       \n\
gpgcheck=1                                                                              \n\
enabled=1                                                                               \n\
" > /etc/yum.repos.d/mariadb.repo

RUN yum install -y reposync createrepo httpd                                            && \
    rpm --import ${GPG_KEY}                                                             && \
    reposync --gpgcheck --download-metadata -p /var/www/html -r cloudera-manager -l     && \
    createrepo /var/www/html                                                            && \
    curl -O -J "${GPG_KEY}"                                                             && \
    echo > /etc/httpd/conf.d/welcome.conf                                               && \
    yum clean all                                                                       && \
    rm -rf /var/cache/yum


VOLUME ["/var/www/html"]

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-DFOREGROUND"]