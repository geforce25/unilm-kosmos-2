#!/bin/bash
if [ ! -f data/kosmos-2.pt ]
then
	pushd data
    wget -O kosmos-2.pt "https://conversationhub.blob.core.windows.net/beit-share-public/kosmos-2/kosmos-2.pt?sv=2021-10-04&st=2023-06-08T11%3A16%3A02Z&se=2033-06-09T11%3A16%3A00Z&sr=c&sp=r&sig=N4pfCVmSeq4L4tS8QbrFVsX6f6q844eft8xSuXdxU48%3D"
    popd
fi

docker create --rm --name kosmos-2-temp -v kosmos-2:/home/ai/models kosmos-2 bash
docker cp ${PWD}/data/kosmos-2.pt kosmos-2-temp:/home/ai/models
docker container rm kosmos-2-temp