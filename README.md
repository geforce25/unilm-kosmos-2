# KOSMOS-2 Docker
This fork of the [unilm](https://github.com/microsoft/unilm/tree/master/kosmos-2) repo by Microsoft is specifically designed to make it easier to build and run the KOSMOS-2 model via a GPU-accelerated Docker container. As of July 2023, the original instructions for running the code locally don't work and the provided scripts leads to a major number of compatibility mismatches between PyTorch and other libraries. Compared to the original repo, most of the changes here are contained within the `kosmos-2` folder. 

This repo provides a `Dockerfile` and a few handy scripts to simplify the process of running the model locally.

## Prerequisites
I tested the code on a Windows 11 machine with a single Nvidia GeForce RTX 4090 and running Docker within WSL. On this machine, inference takes about 8 seconds on average.

The model should run on any Linux machine with a relatively recent Nvidia graphics card (Geforce 3060 and up). If you are on Windows, make sure to setup WSL and activate Docker to run within the WSL environment. 

Finally, make sure that GPU passthrough for Docker is properly enabled for your computer (On Windows it requires the most recent update of Windows 10 or Windows 11).

*If you have a graphics card older than a Geforce 3060, you may need to tweak the Dockerfile as dollows.*

*The line*
```
ENV TORCH_CUDA_ARCH_LIST 8.6+PTX
```
*defines the CUDA architecture that will be used to build the Facebook `xformers` library. This setting should work for the most recent Nvidia cards. However, if you have an older card you may need to change this value according to this [page](https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/). Newer CUDA architectures are not supported by version 11.7 of CUDA supplied by the base Docker image. Unfortunately updating to a newer version of CUDA breaks the build.* 

## Building the Docker container
1. Clone the repo
```
git clone https://github.com/geforce25/unilm-kosmos-2.git unilm
```
2. Navigate to the folder that contains the `KOSMOS-2` model
```
cd unilm/kosmos-2
```
4. Deploy the public checkpoint of the KOSMOS-2 model.
```
./deploy.sh
```
The first time you run this script, it will automatically download the model (about 19GB) and then it will then copy into a local Docker volume. Depending of the speed of your connection and the speed of your storage this step might take 30-45 minutes.

The Docker volume allows the model file itself to persist outside of the Docker image. Using a volume is also necessary for WSL as direct mount points to the file systems are extremely slow due to some limitations of NTFS.
5. Build the Docker image

```
./build.sh
```

The whole process takes about 40 minutes on a PC with a Intel i9-13500K CPU and 64GB of DDR5 RAM. Be patient!

4. Start the container
```
./run.sh
```
5. Run the GRADIO example
```
bash run_gradio.sh
```
6. View the GRADIO UI in the browser

Once you run the example, the console log will show you two URLs like these
```
Running on local URL:  http://127.0.0.1:7860
Running on public URL: https://5583aa1234988xxxxx.gradio.live
```
Copy the URL link and paste it in your browser.

At this point running the example itself should be pretty straightforward.

## Where to go next?
Having the example running locally is the first step to start exploring not just the capabilities of the model itself, but also the overall implementation of the code that generates the predictions. My advice is to: 
1. install the Dev Containers extenstion of VSCode  
2. Attach to the running container hosting the KOSMOS-2 model
3. Use the debugger to place breakpoints in the code and follow the flow of execution

## License
This project is licensed under the license found in the LICENSE file in the root directory of this source tree.
Portions of the source code are based on the [transformers](https://github.com/huggingface/transformers) project.

[Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct)