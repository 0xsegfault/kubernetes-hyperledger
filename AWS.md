Kubernetes Production
=============

# Basic setup
Here we will explore just creating a cluster on AWS
https://aws.amazon.com/blogs/compute/kubernetes-clusters-aws-kops/
curl ipinfo.io/ip

## Commands
1. Install Kops
```bash

```
2. Install aws cli
```bash
...
aws configure
```
3. Create a `state store`
```bash
aws s3api create-bucket --bucket fusionware-kubernetes-learning --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
```
you can remove the bucket with the following command
```bash
aws s3api delete-bucket --bucket fusionware-kubernetes-learning --region us-west-2
```
4. Create cluster using Kops
```bash
export KOPS_STATE_STORE=s3://fusionware-kubernetes-learning
kops create cluster fusionware-k8s-learning.k8s.local --zones us-west-2c --yes
```
Example output
```bash
I1015 12:51:11.857618   11804 create_cluster.go:480] Inferred --cloud=aws from zone "us-west-2c"
I1015 12:51:12.231693   11804 subnets.go:184] Assigned CIDR 172.20.32.0/19 to subnet us-west-2c
I1015 12:51:14.043311   11804 create_cluster.go:1351] Using SSH public key: /home/fusion/.ssh/id_rsa.pub
I1015 12:51:16.530743   11804 apply_cluster.go:505] Gossip DNS: skipping DNS validation
I1015 12:51:17.322021   11804 executor.go:103] Tasks: 0 done / 77 total; 30 can run
I1015 12:51:19.092825   11804 vfs_castore.go:735] Issuing new certificate: "ca"
I1015 12:51:19.277038   11804 vfs_castore.go:735] Issuing new certificate: "apiserver-aggregator-ca"
I1015 12:51:20.649672   11804 executor.go:103] Tasks: 30 done / 77 total; 24 can run
I1015 12:51:21.878088   11804 vfs_castore.go:735] Issuing new certificate: "kube-proxy"
I1015 12:51:21.961861   11804 vfs_castore.go:735] Issuing new certificate: "kubelet-api"
I1015 12:51:21.967394   11804 vfs_castore.go:735] Issuing new certificate: "apiserver-aggregator"
I1015 12:51:22.261079   11804 vfs_castore.go:735] Issuing new certificate: "kube-scheduler"
I1015 12:51:22.302603   11804 vfs_castore.go:735] Issuing new certificate: "kubecfg"
I1015 12:51:22.393957   11804 vfs_castore.go:735] Issuing new certificate: "kube-controller-manager"
I1015 12:51:22.417768   11804 vfs_castore.go:735] Issuing new certificate: "kops"
I1015 12:51:22.465901   11804 vfs_castore.go:735] Issuing new certificate: "apiserver-proxy-client"
I1015 12:51:22.604972   11804 vfs_castore.go:735] Issuing new certificate: "kubelet"
I1015 12:51:24.385230   11804 executor.go:103] Tasks: 54 done / 77 total; 19 can run
I1015 12:51:25.542719   11804 launchconfiguration.go:380] waiting for IAM instance profile "nodes.fusionware-k8s-learning.k8s.local" to be ready
I1015 12:51:25.631589   11804 launchconfiguration.go:380] waiting for IAM instance profile "masters.fusionware-k8s-learning.k8s.local" to be ready
I1015 12:51:36.541638   11804 executor.go:103] Tasks: 73 done / 77 total; 3 can run
I1015 12:51:38.037407   11804 vfs_castore.go:735] Issuing new certificate: "master"
I1015 12:51:38.701941   11804 executor.go:103] Tasks: 76 done / 77 total; 1 can run
I1015 12:51:39.264287   11804 executor.go:103] Tasks: 77 done / 77 total; 0 can run
I1015 12:51:39.506412   11804 update_cluster.go:290] Exporting kubecfg for cluster
kops has set your kubectl context to fusionware-k8s-learning.k8s.local

Cluster is starting.  It should be ready in a few minutes.

Suggestions:
 * validate cluster: kops validate cluster
 * list nodes: kubectl get nodes --show-labels
 * ssh to the master: ssh -i ~/.ssh/id_rsa admin@api.fusionware-k8s-learning.k8s.local
 * the admin user is specific to Debian. If not using Debian please use the appropriate user based on your OS.
 * read about installing addons at: https://github.com/kubernetes/kops/blob/master/docs/addons.md.
```
If a ssh error occurs
```bash
ssh-keygen
```
How to delete
```bash
kops delete cluster fusionware-k8s-learning.k8s.local --yes
```


# High Availability
Here we will examine high availability with Kubernetes

## Commands
Create cluster
```bash
kops create cluster fusionware-k8s-learning.k8s.local --zones us-west-2a,us-west-2b,us-west-2c --node-count 3 --master-zones us-west-2a,us-west-2b,us-west-2c --yes
```

## Persistent Volumes

