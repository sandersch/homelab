#!/bin/bash

set -euxo pipefail

apps="sabnzbd sonarr radarr"

for app in $apps; do
  echo kubectl -n $app -f "../../apps/$app/templates/pvc-$app-config.yaml"
  echo kubectl -n $app -f "./populate-$app-config-pvc-job.yaml"
done
