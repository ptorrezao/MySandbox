curl -X GET \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $1" \
"https://api.digitalocean.com/v2/kubernetes/clusters/$2/kubeconfig" \
> creds/config