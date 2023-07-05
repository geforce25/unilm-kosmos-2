FROM nvcr.io/nvidia/pytorch:23.06-py3

RUN pip install --upgrade pip
RUN pip install ninja

RUN mkdir -p /home/ai

WORKDIR /home/ai
RUN git clone https://github.com/pytorch/audio
WORKDIR /home/ai/audio
RUN python setup.py install

WORKDIR /home/ai
RUN git clone https://github.com/pytorch/fairseq
WORKDIR /home/ai/fairseq
# RUN pip install --no-deps --editable ./
RUN python setup.py install

# WORKDIR /home/ai
# RUN git clone https://github.com/NVIDIA/apex
# WORKDIR /home/ai/apex
# RUN pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" \
#   --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
#   --global-option="--fast_multihead_attn" ./

WORKDIR /home/ai
RUN git clone https://github.com/geforce25/unilm-kosmos-2.git unilm
WORKDIR /home/ai/unilm/kosmos-2
# RUN pip install  --no-deps fairseq/ 
RUN pip install infinibatch/
RUN pip install ftfy
RUN pip install -e torchscale
RUN pip install -e open_clip
RUN pip install --user git+https://github.com/microsoft/DeepSpeed.git@v0.9.5
RUN pip install tiktoken
RUN pip install sentencepiece
RUN pip install -U xformers==0.0.20
