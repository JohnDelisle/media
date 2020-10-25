FROM ubuntu:18.04

# environment 
ENV MEDIA_USER="plex"
ENV MEDIA_UID="999"
ENV MEDIA_GROUP="plex"
ENV MEDIA_GID="999"

# plex user
RUN groupadd -g ${MEDIA_GID} ${MEDIA_GROUP} && useradd -m -u ${MEDIA_UID} -g ${MEDIA_GID} -s /bin/sh ${MEDIA_USER}

# directories
RUN mkdir -p /library /config
RUN chown -R ${MEDIA_USER}:${MEDIA_GROUP} /library /config

# volumes 
VOLUME ["/library", "/config"]

# pre-reqs for next steps
RUN apt-get update && apt-get install -y gnupg


# ### OLD
# # sabnzbd
# RUN apt-get update && apt-get install -y sabnzbdplus unzip 

# sabnzbd
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository multiverse
RUN add-apt-repository universe
RUN add-apt-repository ppa:jcfp/nobetas
RUN add-apt-repository ppa:jcfp/sab-addons
RUN apt-get update && apt-get install -y sabnzbdplus

# cleanup
RUN apt-get clean

# launch sabnzbd
USER ${MEDIA_USER}:${MEDIA_GROUP}
# 
CMD ["/usr/bin/sabnzbdplus", "--browser", "0", "--server", "0.0.0.0:8080", "--config-file", "/config/sabnzbd.ini"]
EXPOSE 8080/tcp

