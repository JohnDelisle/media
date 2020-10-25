FROM ubuntu:18.04

# environment 
ENV MEDIA_USER="plex"
ENV MEDIA_UID="999"
ENV MEDIA_GROUP="plex"
ENV MEDIA_GID="999"
ENV DEBIAN_FRONTEND=noninteractive
ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/config/Library/Application Support"
ENV PLEX_MEDIA_SERVER_HOME="/usr/lib/plexmediaserver"
ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS="6"
ENV PLEX_MEDIA_SERVER_INFO_VENDOR="Ubuntu"
ENV PLEX_MEDIA_SERVER_INFO_DEVICE="PC"
ENV PLEX_MEDIA_SERVER_INFO_MODEL="x86_64"
ENV PLEX_MEDIA_SERVER_INFO_PLATFORM_VERSION="18.04.5LTS(BionicBeaver)"
ENV LD_LIBRARY_PATH="/usr/lib/plexmediaserver/lib"

# plex user
RUN groupadd -g ${MEDIA_GID} ${MEDIA_GROUP} && useradd -d /config -u ${MEDIA_UID} -g ${MEDIA_GID} -s /bin/sh ${MEDIA_USER}

# directories
RUN mkdir -p /library /config "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"
RUN chown -R ${MEDIA_USER}:${MEDIA_GROUP} /library /config "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"

# volumes 
VOLUME ["/library", "/config"]

# pre-reqs for next steps
RUN apt-get update && apt-get install -y ca-certificates gnupg

# plex 
RUN echo "deb https://downloads.plex.tv/repo/deb public main" > /etc/apt/sources.list.d/plexmediaserver.list
ADD https://downloads.plex.tv/plex-keys/PlexSign.key /tmp/
RUN apt-key add /tmp/PlexSign.key
RUN apt-get update && apt-get install -y plexmediaserver --option=Dpkg::Options::=--force-confdef
RUN mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"
RUN chown ${MEDIA_USER}:${MEDIA_GROUP} "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"

# cleanup
RUN apt-get clean

# launch plex
USER ${MEDIA_USER}:${MEDIA_GROUP}
CMD ["/usr/lib/plexmediaserver/Plex Media Server"]
EXPOSE 32400/tcp 3005/tcp 8324/tcp 32469/tcp 1900/udp 32410/udp 32412/udp 32413/udp 32414/udp

