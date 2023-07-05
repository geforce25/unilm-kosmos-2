FROM nvcr.io/nvidia/pytorch:22.10-py3
RUN mkdir -p /home/ai
WORKDIR /home/ai
RUN git clone https://github.com/geforce25/unilm-kosmos-2.git unilm
WORKDIR /home/ai/unilm/kosmos-2
RUN pip install --upgrade pip
RUN pip install  --no-deps fairseq/ 
RUN pip install infinibatch/
RUN pip install ftfy
RUN pip install -e torchscale
RUN pip install -e open_clip
RUN pip install --user git+https://github.com/microsoft/DeepSpeed.git@v0.9.5
RUN pip install tiktoken
RUN pip install sentencepiece
# RUN pip install -U xformers==0.0.20
