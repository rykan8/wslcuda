# latest version / other OS -> https://developer.download.nvidia.com/compute/cuda/repos/
# reference: https://zenn.dev/pon_pokapoka/articles/nvidia_cuda_install

# check compatible cuDNN list 
# apt list libcudnn8 -a

# replace version you want to install
cudnn_version=8.9.7.29
cuda_version=cuda12.2


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
# the latest version it work is 537.99
# sudo apt nvidia-driver-537
# reboot

# stop update of nvidia driver because bug remained. (Segmentation fault)
sudo apt-mark hold nvidia-driver-537

# check nvidia driver
nvidia-smi

# install cuda-toolkit
sudo apt install -y cuda-toolkit-12-2

# # Append the command to add a directory to the PATH in the .bashrc file
echo 'export PATH="/usr/local/cuda/bin${PATH:+:${PATH}}"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"' >> ~/.bashrc
source ~/.bashrc

# check CUDA version
nvcc -V

# install cuDNN
sudo apt install libcudnn8=${cudnn_version}-1+${cuda_version}
sudo apt install libcudnn8-dev=${cudnn_version}-1+${cuda_version}
# sudo apt install libcudnn8-samples=${cudnn_version}-1+${cuda_version}

# check CuDNN
dpkg -l | grep "cudnn"