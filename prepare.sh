#!/usr/bin/env bash

# Install Terraform
wget -N "https://releases.hashicorp.com/terraform/0.8.5/terraform_0.8.5_linux_amd64.zip" -P /tmp
yum -y install unzip
unzip -o /tmp/terraform_0.8.5_linux_amd64.zip -d /usr/local/bin/

# Install Go
wget -N "https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz" -P /tmp
tar -C /usr/local -xzf /tmp/go1.7.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin

# Install Terraform Xen Provider
rm -fR /tmp/gocode
mkdir -p /tmp/gocode/src/github.com/amfranz/
git clone "https://github.com/amfranz/terraform-provider-xenserver" /tmp/gocode/src/github.com/amfranz/terraform-provider-xenserver
export GOPATH=/tmp/gocode
cd /tmp/gocode/src/github.com/amfranz/terraform-provider-xenserver
go get
cp /tmp/gocode/bin/terraform-provider-xenserver /usr/local/bin

# Clean /tmp
rm -fR /tmp/terraform_0.8.5_linux_amd64.zip
rm -fR /tmp/go1.7.5.linux-amd64.tar.gz
rm -fR /tmp/gocode


