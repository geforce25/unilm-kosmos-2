FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get update
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y python3.10
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
RUN apt-get install python3-distutils python3-apt
RUN apt-get install -y curl
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.10 get-pip.py
RUN apt install -y libpython3.10-dev
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
RUN pip install sentencepiece
RUN pip install scipy
RUN pip install gradio
RUN pip install opencv-python
RUN pip install tensorboardX

ENV LD_LIBRARY_PATH /usr/local/cuda-11.7/lib64
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda-11.7/include
ENV PATH /usr/local/cuda-11.7/bin:$PATH
RUN pip install -v -U git+https://github.com/facebookresearch/xformers.git@main#egg=xformers

WORKDIR /home/ai
RUN git clone --depth 1 --branch 23.05 https://github.com/NVIDIA/apex
WORKDIR /home/ai/apex

RUN pip install -v --disable-pip-version-check --no-cache-dir \
    --global-option="--cpp_ext" --global-option="--cuda_ext" ./

WORKDIR /home/ai/unilm/kosmos-2