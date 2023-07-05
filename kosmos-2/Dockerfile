FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install python3.10
RUN apt install -y python3-pip
RUN apt-get install -y git

RUN pip install --upgrade pip

RUN mkdir -p /home/ai
WORKDIR /home/ai
RUN git clone https://github.com/geforce25/unilm-kosmos-2.git unilm

WORKDIR /home/ai/unilm/kosmos-2
RUN pip install fairseq/
RUN pip install infinibatch/
RUN pip install ftfy
RUN pip install -e torchscale
RUN pip install -e open_clip
RUN pip install --user git+https://github.com/microsoft/DeepSpeed.git@v0.9.5
RUN pip install tiktoken
RUN pip install -v -U git+https://github.com/facebookresearch/xformers.git@main#egg=xformers
RUN pip install sentencepiece
RUN pip install scipy

WORKDIR /home/ai
RUN git clone --depth 1 --branch 23.05 https://github.com/NVIDIA/apex
WORKDIR /home/ai/apex

RUN pip install -v --disable-pip-version-check --no-cache-dir \
    --global-option="--cpp_ext" --global-option="--cuda_ext" ./

WORKDIR /home/ai/unilm/kosmos-2