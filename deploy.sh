#!/bin/bash
VERSION=${1:-v2}
docker build --pull . -f Dockerfile -t aolifu/pairdrop:$VERSION
docker push aolifu/pairdrop:$VERSION

docker stop pairdrop
docker rm pairdrop

docker run -d --restart=unless-stopped --name=pairdrop -p 11009:3000 aolifu/pairdrop:$VERSION
