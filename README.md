# Final-ITI-CI-CD-Project
Creating infrastructure and deployment process using Terraform (IaC) to implement and configue secure Elastic Kubernetes Service (EKS) on Amazon Web Service (AWS) to host Jenkins on the cluster .
# Requirments
* git
* Terraform
* Docker
* Aazon cli SDK
* kubectl
Access to a GCP project with the necessary permissions to create and manage resources.
# How to use:
1-clone this repo:
<pre><code class="copy-button">
 git clone[ https://github.com/Merit516/Final-ITI-CI-CD-Project/
</code></pre>
2-
<pre><code class="copy-button">
cd terraform
</code></pre>
3- Install infrastructure with terraform
<pre><code class="copy-button">
terraform init                     #initializes a working directory and installs plugins for AWS provider
terraform plan                     #to check the changes
terraform apply -auto-approve      #creating the resources on AWS </clipboard-copy>
</code></pre>
4-SSH into the Jump server to install kubectl:
<pre><code class="copy-button">
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl.sha256
</code></pre>

Check the SHA-256 checksum for your downloaded binary with the following command: sha256sum -c kubectl.sha256 When using this command, make sure that you see the following output: kubectl: OK
* Then, Apply execute permissions to the binary: chmod +x ./kubectl
*  Copy the binary to a folder in your PATH. If you have already installed a version of kubectl, then we recommend creating a $HOME/bin/kubectl and ensuring that $HOME/bin comes first in your $PATH:
<pre><code class="copy-button">
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
</code></pre>
* Add the $HOME/bin path to your shell initialization file so that it is configured when you open a shell:
<pre><code class="copy-button">
mecho 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
</code></pre>
*After you install kubectl, you can verify its version: kubectl version --short --client
4-  SSH into the Jump server again to install AWS cli:
<pre><code class="copy-button">
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
</code></pre>
5 - Configure using your private cluster:
* aws configure and add your AWS Access Key ID and AWS Secret Access Key
* Create a kubeconfig file for your cluster. Replace region-code with the AWS Region that your cluster is in and replace my-cluster with the name of your cluster.
<pre><code class="copy-button">
aws eks update-kubeconfig --region us-east-1 --name my-eks
</code></pre>
6-Apply Jenkins-Deployments files "Cpoyied to batsion host  From Local PC in meta-data"
<pre><code class="copy-button">
     kubectl apply -f Jenkins-Deployments 
</code></pre>

" This command will create jenkins namespaces,jenkins-deployment,jenkins-service,jenkins-service-account,jenkins-volume,slave-deployment and slave-service."


