FROM node

RUN apt-get -y update && \
    apt-get -y upgrade

WORKDIR /applications/docker-host

RUN curl -fsSL https://test.docker.com -o test-docker.sh && \
    sh test-docker.sh

ARG INSTALLER_URI
ARG AGENT_NAME
ARG AGENT_IDENTIFIER
ARG HYSH_START_TEMPLATE_URL

COPY ./container.sh .

# Download the HyperShell agent, set up start.sh file
RUN wget -O - ${HYSH_START_TEMPLATE_URL} | INSTALLER_URI=${INSTALLER_URI} AGENT_IDENTIFIER=${AGENT_IDENTIFIER} AGENT_NAME=${AGENT_NAME} sh -s download && \
    ./start.sh install && \
    chmod +x container.sh

# Start the HyperShell agent
CMD ["sh", "-c",  "./container.sh"]
