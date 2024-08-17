This repo is for:
- Windows/WSL2でCUDAを使おうとした際のメモ

## environment:
2024.08.17 \
Windows10 /WSL2

wsl --version
```
WSL バージョン: 2.2.4.0
カーネル バージョン: 5.15.153.1-2
WSLg バージョン: 1.0.61
MSRDC バージョン: 1.2.5326
Direct3D バージョン: 1.611.1-81528511
DXCore バージョン: 10.0.26091.1-240325-1447.ge-release
Windows バージョン: 10.0.19045.4780
```

## Memo01 : Overview

- Rancher DesktopはCUDAの動作に難あり。動作させるならpodman。 \
 https://github.com/rancher-sandbox/rancher-desktop/issues/3968


## Memo02_: Install

- nVidiaのドライバは538以降はSegmentation faultが出る。 \
github issue(Microsoft/WSL) https://github.com/microsoft/WSL/issues/11277 \
work latest driver(nVidia, 537.99 )https://www.nvidia.co.jp/download/driverResults.aspx/216863/jp

- CUDAはドライバと適合するバージョンがある
https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html

- CuDNNはCUDAと適合するバージョンがある。
https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html

```sh
# check compatible cuDNN list 
apt list libcudnn8 -a

# set version you want to install
cudnn_version=8.9.7.29
cuda_version=cuda12.2
```


