#!/bin/bash

set -e

if [[ -z "$TRAVIS_TAG" ]]; then
  version="snapshot-$(echo "$TRAVIS_BRANCH" | sed 's#[^a-zA-Z0-9_-]#-#g')"
else
  version="${TRAVIS_TAG}"
fi

go build -ldflags="-X 'github.com/Dynatrace/dynatrace-activegate-operator/version.Version=${version}'" -tags containers_image_storage_stub -o ./build/_output/bin/dynatrace-activegate-operator ./cmd/manager
