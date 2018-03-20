FROM centos:centos7

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
    useradd -ms /bin/bash circleci

USER circleci

CMD ["bash"]
