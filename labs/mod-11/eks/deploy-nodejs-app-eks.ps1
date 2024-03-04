# # 1. create core-ns namespace
kubectl create namespace core-ns
# namespace/core-ns created

# # 2. get pods from core-ns namespace (there're no pods at this point)
kubectl get pods --namespace=core-ns --context=aws-admin@ eksctl.io
# No resources found in core-ns namespace.

# # 3. get eks context
kubectl config get-contexts
CURRENT   NAME                                        CLUSTER                           AUTHINFO                                    NAMESPACE
# *         aws-admin@ eksctl.io    eksctl.io   aws-admin@ eksctl.io
#           kind-cluster-d                              kind-cluster-d                    kind-cluster-d

# # 4. create nodejs-app deployment
kubectl apply -f .\eks\config\nodejs-app-deployment-eks.yaml --context=aws-admin@ eksctl.io --namespace=core-ns
# deployment.apps/nodejs-app-eks created

# # 5. create nodejs-app service
kubectl apply -f .\eks\config\nodejs-app-service-eks.yaml --context=aws-admin@ eksctl.io --namespace=core-ns   
# service/nodejs-app-eks created

# # 6. list services
kubectl get all --context=aws-admin@ eksctl.io --namespace=core-ns    
# NAME                                  READY   STATUS    RESTARTS   AGE
# pod/nodejs-app-eks-7b98ccfcf7-44hxz   1/1     Running   0          39m
# pod/nodejs-app-eks-7b98ccfcf7-wx9md   1/1     Running   0          39m

# NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
# service/nodejs-app-eks   ClusterIP   xx.xxx.255.86   <none>        8081/TCP   38m

# NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/nodejs-app-eks   2/2     2            2           40m

# NAME                                        DESIRED   CURRENT   READY   AGE
# replicaset.apps/nodejs-app-eks-7b98ccfcf7   2         2         2       40m

# # 7. get processes inside a pod
kubectl exec -it pod/nodejs-app-eks-7b98ccfcf7-44hxz --context=aws-admin@ eksctl.io --namespace=core-ns -- ps aux      

# # 8. create reverse proxy to nodejs-app (open firefox after that and navigate to http://localhost:12345)
$pfjob = Start-Job -Name nodejs-app-eks-revpxy -ScriptBlock { kubectl port-forward service/nodejs-app-eks 12345:8081 --context=aws-admin@ eksctl.io --namespace=core-ns }
Receive-Job $pfjob.Id
Get-Job $pfjob.Id

# # stop and remove job
# Stop-Job $pfjob.Id
# Remove-Job $pfjob.Id

# # 9. install aws load balancer controller add-on and create a kubernetes service in the cluster that gives to us access to the nodejs-app depoyment pods

# # 9.1 create a load balancer iam policy
curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.4.3/docs/install/iam_policy.json
#   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                  Dload  Upload   Total   Spent    Left  Speed
# 100  7617  100  7617    0     0  24445      0 --:--:-- --:--:-- --:--:-- 24491
& 'C:\Program Files\Amazon\AWSCLIV2\aws.exe' iam create-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://iam_policy.json
# Policy:
#   Arn: arn:aws:iam:: :policy/AWSLoadBalancerControllerIAMPolicy
#   AttachmentCount: 0
#   CreateDate: '2022-09-15T19:11:44+00:00'
#   DefaultVersionId: v1
#   IsAttachable: true
#   Path: /
#   PermissionsBoundaryUsageCount: 0
#   PolicyId: 
#   PolicyName: AWSLoadBalancerControllerIAMPolicy
#   UpdateDate: '2022-09-15T19:11:44+00:00'

# # 9.2 create a load balancer iam role
eksctl create iamserviceaccount --cluster eks-core --region  tutu-zone --namespace=kube-system --name=aws-load-balancer-controller --role-name "eks-core-elb-cntlr-role" --attach-policy-arn=arn:aws:iam:: :policy/AWSLoadBalancerControllerIAMPolicy --approve
# 2022-09-15 21:19:35 [ℹ]  1 existing iamserviceaccount(s) (kube-system/aws-node) will be excluded
# 2022-09-15 21:19:35 [ℹ]  1 iamserviceaccount (kube-system/aws-load-balancer-controller) was included (based on the include/exclude rules)
# 2022-09-15 21:19:35 [!]  serviceaccounts that exist in Kubernetes will be excluded, use --override-existing-serviceaccounts to override
# 2022-09-15 21:19:35 [ℹ]  1 task: {
#     2 sequential sub-tasks: {
#         create IAM role for serviceaccount "kube-system/aws-load-balancer-controller",
#         create serviceaccount "kube-system/aws-load-balancer-controller",
#     } }2022-09-15 21:19:35 [ℹ]  building iamserviceaccount stack "eksctl-eks-core-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
# 2022-09-15 21:19:36 [ℹ]  deploying stack "eksctl-eks-core-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
# 2022-09-15 21:19:36 [ℹ]  waiting for CloudFormation stack "eksctl-eks-core-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
# 2022-09-15 21:20:07 [ℹ]  waiting for CloudFormation stack "eksctl-eks-core-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
# 2022-09-15 21:20:42 [ℹ]  waiting for CloudFormation stack "eksctl-eks-core-addon-iamserviceaccount-kube-system-aws-load-balancer-controller"
# 2022-09-15 21:20:42 [ℹ]  created serviceaccount "kube-system/aws-load-balancer-controller"

# # 9.3 install aws load balancer controller using the helm chart
helm repo add eks https://aws.github.io/eks-charts
# "eks" has been added to your repositories
helm repo update
# Hang tight while we grab the latest from your chart repositories...
# ...Successfully got an update from the "metrics-server" chart repository
# ...Successfully got an update from the "eks" chart repository
# ...Successfully got an update from the "cortex-helm" chart repository
# ...Successfully got an update from the "grafana" chart repository
# ...Successfully got an update from the "prometheus-community" chart repository
# ...Successfully got an update from the "bitnami" chart repository
# Update Complete. ⎈Happy Helming!⎈
helm install aws-load-balancer-controller eks/aws-load-balancer-controller -n kube-system --set clusterName=eks-core --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller # add this param for eu-west-1 region: --set image.repository= /amazon/aws-load-balancer-controller
# NAME: aws-load-balancer-controller
# LAST DEPLOYED: Thu Sep 15 21:24:45 2022
# NAMESPACE: kube-system
# STATUS: deployed
# REVISION: 1
# TEST SUITE: None
# NOTES:
# AWS Load Balancer controller installed!
kubectl get deployment -n kube-system aws-load-balancer-controller 
# NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
# aws-load-balancer-controller   2/2     2            2           5m47s

# # 9.4 create the kubernetes service for nodeja-app pods and get the external-ip and tcp port to access to it from firefox
kubectl apply -f .\eks\config\nodejs-app-load-balancer-service-eks.yaml --context=aws-admin@ eksctl.io --namespace=core-ns 
# service/nodejs-svc-lbr created
kubectl get services nodejs-svc-lbr --context=aws-admin@ eksctl.io --namespace=core-ns 
# NAME             TYPE           CLUSTER-IP       EXTERNAL-IP                                                                     PORT(S)        AGE
# nodejs-svc-lbr   LoadBalancer   xx.xxx.249.156    .elb. tutu-zone.amazonaws.com   80:31856/TCP   42s

# # 9.5 access to the nodejs-app using the http://k8s-coren-nodejssv-5e5b64a136-  url (you must wait for a while until the load balancer is ready [:(] )
curl http://k8s-coren-nodejssv-5e5b64a136- 
# <!DOCTYPE html>
# <html lang="en">

# <head>
#     <title>About Sharks</title>
#     <meta charset="utf-8">
#     <meta name="viewport" content="width=device-width, initial-scale=1">
#     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
#     <link href="css/styles.css" rel="stylesheet">
#     <link href="https://fonts.googleapis.com/css?family=Merriweather:400,700" rel="stylesheet" type="text/css">
# </head>

# <body>
#     <nav class="navbar navbar-dark bg-dark navbar-static-top navbar-expand-md">
# ...
