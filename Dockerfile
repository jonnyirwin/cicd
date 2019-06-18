FROM jenkins/jenkins

# This is not ideal, setting the docker group id at build time, as this may well change between machines.
ARG DOCKER_GROUP_ID=976

USER root

RUN groupadd --gid $DOCKER_GROUP_ID docker \
      && usermod -aG docker jenkins

USER jenkins

# TODDO: from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle