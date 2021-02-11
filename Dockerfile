FROM jenkins/jenkins:2.271-jdk11
USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

##Docker Install
#USER root
#RUN apt-get update && apt-get install -y apt-transport-https \
#       ca-certificates curl gnupg2 \
#       software-properties-common
#RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
#RUN add-apt-repository \
#       "deb [arch=amd64] https://download.docker.com/linux/debian \
#       $(lsb_release -cs) stable"
#RUN apt-get update && apt-get install -y docker-ce-cli