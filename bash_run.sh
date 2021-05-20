set -e
#ssh keys generation
ssh-keygen -m PEM -t rsa -b 2048 -C jenkins@jenkins -f jenkins.pem -N "" -q
chmod 600 jenkins.pem
mv jenkins.pem.pub jenkins.pub
cp jenkins.pem /home/dsoroki/.ssh/.
cp jenkins.pub /home/dsoroki/.ssh/.
chmod 600 jenkins.pem /home/dsoroki/.ssh/jenkins.pem

echo please insert credentials like:
echo "[default]"
echo "aws_access_key_id = <AWS_ACCESS_TOKEN>"
echo "aws_secret_access_key = <AWS_SECRET_ACCESS_KEY>"
nano ~/.aws/credentials

#terraform apply
tfenv install latest
tfenv use latest

cd ./terraform
terraform destroy
terraform init
#terraform plan
terraform apply
cd -

#ansible apply
#pip3 install boto
#workaround
sudo ln -sf `which python3` /usr/bin/python
cd ./ansible
ansible-playbook -i ec2.py linux_jenkins_slave.yml
ansible-playbook -i ec2.py linux_jenkins_slave_docker_install.yml
ansible-playbook -i ec2.py linux_jenkins_installation.yml
cd -
