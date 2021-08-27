FROM openjdk:11-jre-slim

MAINTAINER "vikramnagaraju31@gmail.com"

ARG USER=condenast
ARG GROUP=condenast
ARG UID=9414
ARG GID=9414

ENV HOME /home/${USER}

# Install prerequisites
RUN apt-get update && apt-get install -y \
curl

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -c "Conde Nast User" -d $HOME -u ${UID} -g ${GID} -m ${USER} && \
    echo 'condenast ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV CONDEN_APP_HOME=${HOME}/condenast

RUN mkdir -p ${CONDEN_APP_HOME}	

COPY target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar ${CONDEN_APP_HOME}

RUN chown -R ${USER}:${GROUP} ${HOME} \
    && chmod +x $HOME

EXPOSE 8080

USER condenast

WORKDIR ${CONDEN_APP_HOME}

CMD ["java", "-jar", "spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar"]