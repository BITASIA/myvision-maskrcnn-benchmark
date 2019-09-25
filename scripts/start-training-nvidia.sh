# NVAWS_IMAGE_NAME='NVIDIA Deep Learning  AMI*'
# NVAWS_IMAGE_ID=$(aws ec2 describe-images --filters "Name=name,Values=$NVAWS_IMAGE_NAME" | jq .Images[0].ImageId | sed 's/\"//g') && echo NVAWS_IMAGE_ID=$NVAWS_IMAGE_ID
# #Variables
# weights=$1
. config/credentials.config
instanceId='i-0e6f292364e057b1c'
aws ec2 start-instances --instance-ids $instanceId
$(aws ec2 describe-instances --instance-ids $instanceId)
# ssh -i "../ssh/nvidia1.pem" ubuntu@ec2-3-219-216-243.compute-1.amazonaws.com <<EOF
# docker --version && \
# cd myvision-model/MaskRCNN-NVIDIA && \
# # mkdir data && \
# cd pytorch/ && bash scripts/docker/build.sh && \
# bash scripts/docker/interactive.sh /home/ubuntu/myvision-model/MaskRCNN-NVIDIA/data
# bash scripts/train.sh
# # git clone https://$username:$token@github.com/BITASIA/myvision-model.git && \

# # ./download_dataset.sh data && \


# exit
# EOF

ssh -i "ssh/nvidia1.pem" ubuntu@ec2-3-90-107-74.compute-1.amazonaws.com <<EOF
git clone https://$username:$token@github.com/BITASIA/myvision-model.git
# cd DeepLearningExamples/PyTorch/Segmentation/MaskRCNN/pytorch && git pull && \
# bash scripts/docker/build.sh && \
# bash scripts/docker/interactive.sh /home/ubuntu/myvision-model/MaskRCNN-NVIDIA/data
# bash scripts/train.sh
exit
EOF


# aws s3 sync ../datasets s3://dkitdatasets && \
# docker-machine start myvision-nvidia-trainer
# # bash start-tensorboard.sh
# docker-machine ssh myvision-nvidia-trainer << EOF
# # mkdir data
# # Add the package repositories
# $datapath=\$(pwd)
# distribution=\$(. /etc/os-release;echo $ID$VERSION_ID)
# curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
# curl -s -L https://nvidia.github.io/nvidia-docker/\$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

# sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
# sudo systemctl restart docker
# exit
# EOF
# docker-machine regenerate-certs myvision-nvidia-trainer && \
# eval $(docker-machine env myvision-nvidia-trainer) && \
# bash ../MaskRCNN-NVIDIA/pytorch/scripts/docker/interactive.sh /home/ubuntu/myvision-models
# # echo $datapath
# docker-machine stop myvision-nvidia-trainer
# aws s3 sync s3://dkitmodels-sg ../models