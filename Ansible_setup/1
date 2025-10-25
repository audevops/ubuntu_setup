# Base Ansible image (Alpine 3.8)
FROM williamyeh/ansible:alpine3

# Copy local packages
COPY ./package/*.apk /opt/packages/

# Install curl from local packages, plus bash & iputils
RUN apk add --allow-untrusted /opt/packages/*.apk \
    && apk add --no-cache bash iputils

# Working directory
WORKDIR /ansible

# Keep container running
CMD ["/bin/sh"]

