az acr login --name jmdk8sjmdtfeastus2.azurecr.io

docker tag sonarr  jmdk8sjmdtfeastus2.azurecr.io/media/sonarr
docker tag radarr  jmdk8sjmdtfeastus2.azurecr.io/media/radarr
docker tag plex    jmdk8sjmdtfeastus2.azurecr.io/media/plex
docker tag sabnzbd jmdk8sjmdtfeastus2.azurecr.io/media/sabnzbd

docker push jmdk8sjmdtfeastus2.azurecr.io/media/sonarr
docker push jmdk8sjmdtfeastus2.azurecr.io/media/radarr
docker push jmdk8sjmdtfeastus2.azurecr.io/media/plex
docker push jmdk8sjmdtfeastus2.azurecr.io/media/sabnzbd