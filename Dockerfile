FROM registry.access.redhat.com/ubi9/ubi:9.4-1214.1729773476

ARG USER_HOME_DIR="/home/user"
ARG WORK_DIR="/projects"

# Set SHELL to configure the default shell used in web terminals
# https://github.com/eclipse/che/issues/22524
ENV SHELL=/usr/bin/bash

# Set HOME. Required for CRI-o to set /etc/passwd correctly and in general for other CLI tools
ENV HOME=${USER_HOME_DIR}
ENV BUILDAH_ISOLATION=chroot

COPY --chown=0:0 entrypoint.sh /

RUN dnf --disableplugin=subscription-manager install -y openssl compat-openssl11 libbrotli nodejs; \
    dnf update -y ; \
    dnf clean all ; \
    mkdir -p ${USER_HOME_DIR} ; \
    mkdir -p ${WORK_DIR} ; \
    chgrp -R 0 /home ; \
    chmod +x /entrypoint.sh ; \
    chmod -R g=u /etc/passwd /etc/group /home ${WORK_DIR}

WORKDIR ${WORK_DIR}
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "tail", "-f", "/dev/null" ]
