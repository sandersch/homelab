#!/bin/bash

set -euxo pipefail

apps=plex "sabnzbd sonarr radarr"

for app in $apps; do
  kubectl get namespace $app || kubectl create namespace $app
  kubectl -n $app apply -f "../../apps/$app/templates/pvc-$app-config.yaml"
  kubectl -n $app apply -f "./populate-$app-config-pvc-job.yaml"
done
