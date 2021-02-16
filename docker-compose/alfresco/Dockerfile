FROM greencorecr/alfresco-content-repository-community:6.2.0-ga

USER root

ARG TOMCAT_DIR=/usr/local/tomcat

# Logs always under $TOMCAT/logs folder
RUN echo "cd $TOMCAT_DIR/logs" | tee $TOMCAT_DIR/bin/setenv.sh \
    && chmod +x $TOMCAT_DIR/bin/setenv.sh

# Install modules and addons
RUN mkdir -p $TOMCAT_DIR/amps
COPY modules/amps $TOMCAT_DIR/amps
COPY modules/jars $TOMCAT_DIR/webapps/alfresco/WEB-INF/lib
