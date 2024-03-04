#!/bin/bash
# Kubernetes Training

# example: sh ./labs/mod-02/kind/scripts/api_core_admin_service_account_and_bearer_token.sh cluster-1cp-1wn

# create a authorization bearer token to access to the REST API
cluster=$1
# display cluster information
kubectl config view \
    -o jsonpath='{"Cluster name\tServer\n"}{range .clusters[*]}{.name}{"\t"}{.cluster.server}{"\n"}{end}'

#define the cluster name and get the rest api endpoint
cluster_name=kind-kind-$cluster
APISERVER=$(kubectl config view \
    -o jsonpath="{.clusters[?(@.name==\"$CLUSTER_NAME\")].cluster.server}")

# create a service account, cluster role and cluster role binding for the mod-02-ns namespace
kubectl apply -f - <<EOF
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: core
  namespace: mod-02-ns
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: core-role
  namespace: mod-02-ns
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["*"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: core-role-binding
roleRef:
  kind: ClusterRole
  name: core-role
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: core
  namespace: mod-02-ns
EOF

# wait 5 secs and then create the secret to hold a bearer token for the default account
sleep 5
kubectl apply -f - <<EOF
---
apiVersion: v1
kind: Secret
metadata:
  name: core-token
  annotations:
    kubernetes.io/service-account.name: core
type: kubernetes.io/service-account-token
EOF

# wait until the secret gets the token
while ! kubectl describe secret core-token --namespace mod-02-ns | grep -E '^token' >/dev/null; do
  echo "waiting for token..." >&2
  sleep 1
done

# get the bearer token
TOKEN=$(kubectl get secret core-token --namespace mod-02-ns -o jsonpath='{.data.token}' | base64 --decode)

# simple test
curl -X GET $APISERVER/api --header "Authorization: Bearer $TOKEN" --insecure
