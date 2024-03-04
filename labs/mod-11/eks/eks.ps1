# # 1. eksctl
eksctl info  
# eksctl version: 0.111.0
# kubectl version: v1.24.3
# OS: windows

# # 2. list cluster addons
eksctl utils describe-addon-versions --cluster eks-core --region  tutu-zone 
# 2022-09-15 19:49:15 [ℹ]  Kubernetes version "1.22" in use by cluster "eks-core"
# 2022-09-15 19:49:15 [ℹ]  describing all addon versions
# {"Addons":[{"AddonName":"adot","AddonVersions":[{"AddonVersion":"v0.58.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":true,"PlatformVersions":["*"]}]},{"AddonVersion":"v0.56.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v0.51.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v0.45.0-eksbuild.1","Architecture":["amd64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]}],"Type":"observability"},{"AddonName":"kube-proxy","AddonVersions":[{"AddonVersion":"v1.22.11-eksbuild.2","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.22.6-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":true,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.21.14-eksbuild.2","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.21.2-eksbuild.2","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.20.15-eksbuild.2","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.20.7-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.20.4-eksbuild.2","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]}],"Type":"networking"},{"AddonName":"vpc-cni","AddonVersions":[{"AddonVersion":"v1.11.3-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.11.2-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.11.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.10.3-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.10.2-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.10.1-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":true,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.9.3-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.9.1-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.8.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]}],"Type":"networking"},{"AddonName":"coredns","AddonVersions":[{"AddonVersion":"v1.8.7-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":true,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.8.4-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]}],"Type":"networking"},{"AddonName":"aws-ebs-csi-driver","AddonVersions":[{"AddonVersion":"v1.11.2-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":true,"PlatformVersions":["eks.4+"]}]},{"AddonVersion":"v1.10.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["eks.4+"]}]},{"AddonVersion":"v1.9.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["eks.4+"]}]},{"AddonVersion":"v1.8.0-eksbuild.0","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.7.0-eksbuild.0","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.6.2-eksbuild.0","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.6.1-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.6.0-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.5.3-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]},{"AddonVersion":"v1.5.2-eksbuild.1","Architecture":["amd64","arm64"],"Compatibilities":[{"ClusterVersion":"1.22","DefaultVersion":false,"PlatformVersions":["*"]}]}],"Type":"storage"}]}

# # 3. list cluster information
eksctl get clusters --name eks-core --region  tutu-zone
# NAME            VERSION STATUS  CREATED                 VPC                     SUBNETS                                                                                                                                                 SECURITYGROUPS          PROVIDER
# eks-core     1.22    ACTIVE  2022-09-15T12:25:16Z    vpc-0ae6de3438abb5530   subnet-00455e4ae4efab6b5,subnet-04898aec2dd1713cf,subnet-079aac9acc0ff2272,subnet-0a399135ba184a784,subnet-0daafc31d78c7d147,subnet-0fea6a07cd61e42d5   sg-056ed790e8565020f    EKS

# # 4. list cluster nodegroups
eksctl get nodegroups --cluster eks-core --region  tutu-zone
# CLUSTER         NODEGROUP       STATUS          CREATED                 MIN SIZE        MAX SIZE        DESIRED CAPACITY        INSTANCE TYPE   IMAGE ID        ASG NAME                                                TYPE
# eks-core     ng-35883701     DEGRADED        2022-09-15T12:38:07Z    2               2               2                       t2.large        AL2_x86_64      eks-ng-3sdsdsds    managed

# # 5. list clusters
kubectl config get-clusters               
# NAME
# kind-cluster-d
#  eksctl.io

# # 6. list kubectl contexts
kubectl config get-contexts  
# CURRENT   NAME                                        CLUSTER                           AUTHINFO                                    NAMESPACE
# *         aws-admin@ eksctl.io    eksctl.io   aws-admin@ eksctl.io
#           kind-cluster-d                              kind-cluster-d                    kind-cluster-d

# # 7. list namespaces
kubectl get namespaces             
# NAME              STATUS   AGE
# default           Active   3h47m
# kube-node-lease   Active   3h47m
# kube-public       Active   3h47m
# kube-system       Active   3h47m

# # 8. list cluster nodes
kubectl get nodes --context=aws-admin@ eksctl.io
# NAME                                           STATUS   ROLES    AGE     VERSION
#  . tutu-zone.compute.internal   Ready    <none>   4h51m   v1.22.12-eks-ba74326
#  . tutu-zone.compute.internal   Ready    <none>   4h50m   v1.22.12-eks-ba74326
