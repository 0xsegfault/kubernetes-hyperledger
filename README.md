Kubernetes Hyperledger
==============

## Install
1. install go
2. install nodejs
3. install virtual box
4. install docker-ce
5. install kubectl
6. install minikube
7. install kops
8. install kops ingress-nginx
9. install hyperledger

## Kubernetes
1. kubectl apply -f k8s/a-certs
2. kubectl apply -f k8s/b-subpub-zoo
3. kubectl apply -f k8s/c-subpub-kafka

## Notes
1. Get ubuntu external IP - curl ipinfo.io/ip
2. https://github.com/kubernetes/kops/tree/master/addons/ingress-nginx
3. Nodejs
    - sudo add-apt-repository -y 'deb http://archive.ubuntu.com/ubuntu trusty universe' && sudo apt-get update -y && sudo apt-get dist-upgrade -y && sudo apt-get upgrade -y && sudo apt-get install -y git zsh curl emacs htop g++ build-essential && curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - && sudo apt-get install --yes nodejs && sudo npm install @vue/cli -g
4. Golang
    - curl https://dl.google.com/go/go1.11.2.linux-amd64.tar.gz > go1.11.2.linux-amd64.tar.gz
    - tar -xvf go1.11.2.linux-amd64.tar.gz
    - sudo rm -rf /usr/local/go
	- sudo mv go /usr/local
	- rm go1.11.2.linux-amd64.tar.gz
    - Add to your bash
        a) export GOROOT=/usr/local/go
        b) export GOPATH=/home/nick/Projects/Go
        c) export PATH=$PATH:/usr/local/go/bin
	- source ~/.zshrc
5. Hyperledger
    - curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0