# Add Admin IAM ROLE to EC2
#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
wget https://github.com/kubernetes/kops/releases/download/v1.25.0/kops-linux-amd64
chmod +x kops-linux-amd64 kubectl
mv kubectl /usr/local/bin/kubectl
mv kops-linux-amd64 /usr/local/bin/kops

aws s3api create-bucket --bucket reyaz-kops-testbkt100.k8s.local --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-bucket-versioning --bucket reyaz-kops-testbkt100.k8s.local --region ap-south-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://reyaz-kops-testbkt100.k8s.local
kops create cluster --name reyaz.k8s.local --zones ap-south-1a --master-count=1 --master-size t2.medium --node-count=2 --node-size t2.micro --image ami-09dcba964a9c51505
kops update cluster --name reyaz.k8s.local --yes --admin

#kops validate cluster --wait 10m
