# Terraform - Provision an EKS Cluster

# Create a secrets in Environments on the Github project
Settings >> Environments >> create AWS_ACCESS_KEY and AWS_SECRET_KEY

# Create a secrets in Environments on the Github project
Setting >> secrets >> New repository secret >> create AWS_ACCESS_KEY and AWS_SECRET_KEY


Outputs:

cluster_endpoint = https://258F80C9170DF00B7D486FDC64E5A996.yl4.us-east-2.eks.amazonaws.com
cluster_name = dav-eks-KNdlpdgA
cluster_security_group_id = sg-0325eb5074041d8fd
kubectl_config = apiVersion: v1
preferences: {}
kind: Config

clusters:
- cluster:
    server: https://258F80C9170DF00B7D486FDC64E5A996.yl4.us-east-2.eks.amazonaws.com
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN5RENDQWJDZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJd01EY3hNVEl3TURBME4xb1hEVE13TURjd09USXdNREEwTjFvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTXdyCmJLSW5PcllKTHFpMGdhTUpkSTcrY0h3dTVPOXdYNDM0b3BraWFSS21hUmlaMHBNNTBmZVZJdnRoMjd6Uk8rb0UKRWZCV21jWTlobVBnL0hpbkw0a2VYNi9FQjFualVDZGFJdFVCKzJCOXRjY3VpL3p3b3hQSjVGdnF4Sk82RGRvRQpBZGJwL2hpNlZyRS9BWWZia2cwS3FGTnJWQUd2L2loOXQxZE13V2FzZHlXaXBlMUVnRVcwZE1GK2E4OTJoWVY5ClRnaW96bXhtM3haV3k5RHgwY0dOampWV2hHZE9CbDdZR3BxMEl5ekJNdEFjRTF4MHZQcWNKVkhWSVNpSmJ4M3kKRFg3dnVWNmtCZHVwWGZUbDBHbFQ5UlZLOU0rZUh4TDhTUlN4OWJzeEQrQXVnM0lDMTRmdUtoUVEwd1V1cVcyRwpVRVJSVXp4Z3hzR2lpektNcldVQ0F3RUFBYU1qTUNFd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0RRWUpLb1pJaHZjTkFRRUxCUUFEZ2dFQkFNU2JlWHZaYmRhOTRoWW55b203MVBINTNkOXUKUGc0bHV1R01wWEFKdUlyNk03aVlieU41cmtVaDR4NnpTS2wrR1dHU2xpUkZIVjlXTmxLQ1FFU0laNHRBdDc4Mwp4cUYxS041KzJzTW1adHBDVWhpODM0R3g5clJwN2M0QURpblREaFJjZFl1Wis2aW5OWmRwWTJyK2I0TFhmY0luClZHQTBuYXB3RmFuaHNGcEFvL2xlRzJCVzV3b1lxVlB1bjdKTXdkamFOZGp0VHMxaWJpZXRucndUN3hqZG9VMmcKV3o1NWpCQy9BcWdtUjRubldKVk9lYWZVVjBUOHRhOFVVNWJoRHk5eGppY1RvWXhLdXhXak0wY2tBOEdWSnBVegpFY2UzMGJibjZLa0hCQzl4SWFvdFM0R3JvN0RwakJWRkdMcXBXOTFGbGM0RVdsbFZFbjd2dndiS0xqYz0KLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLQo=
  name: eks_dav-eks-KNdlpdgA

contexts:
- context:
    cluster: eks_dav-eks-KNdlpdgA
    user: eks_dav-eks-KNdlpdgA
  name: eks_dav-eks-KNdlpdgA

current-context: eks_dav-eks-KNdlpdgA

users:
- name: eks_dav-eks-KNdlpdgA
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "dav-eks-KNdlpdgA"

region = us-east-2
```

## Configure kubectl

To configure kubetcl, you need both [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) and [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html).

The following command will get the access credentials for your cluster and automatically
configure `kubectl`.

```shell
$ aws eks --region us-east-1 update-kubeconfig --name dave
```
```shell
$ terraform apply
```

You can view these outputs again by running:

```shell
$ terraform output
```
# setup autocomplete
# setup autocomplete in zsh into the current shell
autoload -Uz compinit
compinit
$ source <(kubectl completion zsh)
# add autocomplete permanently to your zsh shell
$ echo "if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi" >> ~/.zshrc 