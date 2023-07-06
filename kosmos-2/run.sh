#!/bin/bash
docker run -it --rm --gpus=all --ipc=host --privileged --publish 7860:7860 --name kosmos-2-container -v kosmos-2:/home/ai/models kosmos-2 bash