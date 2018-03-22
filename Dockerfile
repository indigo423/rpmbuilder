FROM centos:centos7

ARG NODE_VERSION=8.x

RUN yum -y --setopt=tsflags=nodocs update && \
    yum install -y epel-release && \
    yum install -y autoconf \
                   automake \
                   ctags \
                   elfutils \
                   gcc \
                   gcc-c++ \
                   gettext \
                   intltool \
                   libtool \
                   make \
                   patch \
                   utils \
                   redhat-rpm-config \
                   rpm-build \
                   rpm-sign \
                   spectool \
                   git \
                   yum-utils && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    curl -sL https://rpm.nodesource.com/setup_${NODE_VERSION} | bash - && \
    yum -y install nodejs && \
    useradd -ms /bin/bash circleci

USER circleci

CMD ["bash"]
