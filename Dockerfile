# use official long-term support docker container for jenkins
FROM jenkins/jenkins:lts

# switch to root
USER root

# install SoapUI version 5.4.0
RUN apt-get update && mkdir -p /opt &&\
    curl  https://s3.amazonaws.com/downloads.eviware/soapuios/5.4.0/SoapUI-5.4.0-linux-bin.tar.gz \
    | gunzip -c - | tar -xf - -C /opt && \
    ln -s /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

# drop back to regular jenkins user - good practice
USER jenkins

# no install wizard on Jenkins first run
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# copy security information to the container
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy

# install required plugins
RUN /usr/local/bin/install-plugins.sh \
job-dsl \
script-security:1.44 \
command-launcher:1.2 \
cloudbees-folder:6.4 \
bouncycastle-api:2.16.2 \
structs:1.14 \
workflow-step-api:2.14 \
scm-api:2.2.7 \
workflow-api:2.27 \
junit:1.24 \
antisamy-markup-formatter:1.5 \
token-macro:2.5 \
build-timeout:1.19 \
credentials:2.1.16 \
ssh-credentials:1.13 \
plain-credentials:1.4 \
credentials-binding:1.16 \
timestamper:1.8.9 \
workflow-support:2.18 \
durable-task:1.22 \
workflow-durable-task-step:2.19 \
matrix-project:1.13 \
resource-disposer:0.8 \
ws-cleanup:0.34 \
ant:1.8 \
gradle:1.28 \
pipeline-milestone-step:1.3.1 \
jquery-detached:1.2.1 \
jackson2-api:2.8.11.1 \
ace-editor:1.1 \
workflow-scm-step:2.6 \
workflow-cps:2.49 \
pipeline-input-step:2.8 \
pipeline-stage-step:2.3 \
workflow-job:2.20 \
pipeline-graph-analysis:1.6 \
pipeline-rest-api:2.10 \
handlebars:1.1.1 \
momentjs:1.1.1 \
pipeline-stage-view:2.10 \
pipeline-build-step:2.7 \
pipeline-model-api:1.2.9 \
pipeline-model-extensions:1.2.9 \
apache-httpcomponents-client-4-api:4.5.5-1.0 \
jsch:0.1.54.2 \
git-client:2.7.1 \
git-server:1.7 \
workflow-cps-global-lib:2.9 \
display-url-api:2.2.0 \
mailer:1.21 \
branch-api:2.0.20 \
workflow-multibranch:2.18 \
authentication-tokens:1.3 \
docker-commons:1.11 \
docker-workflow:1.15.1 \
pipeline-stage-tags-metadata:1.2.9 \
pipeline-model-declarative-agent:1.1.1 \
workflow-basic-steps:2.7 \
pipeline-model-definition:1.2.9 \
workflow-aggregator:2.5 \
github-api:1.90 \
git:3.8.0 \
github:1.29.0 \
github-branch-source:2.3.4 \
pipeline-github-lib:1.0 \
mapdb-api:1.0.9.0 \
subversion:2.10.5 \
ssh-slaves:1.26 \
matrix-auth:2.2 \
pam-auth:1.3 \
ldap:1.20 \
email-ext:2.62
