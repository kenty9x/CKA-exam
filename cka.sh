source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

alias k=kubectl
complete -F __start_kubectl k

k config get-contexts                          # display list of contexts 
k config current-context                       # display the current-context
k config use-context my-cluster-name           # set the default context to my-cluster-name

k run --image=nginx --labels=env=prod nginx-prod --dry-run -o yaml > nginx-prodpod.yaml
k get pods --sort-by=.metadata.name
k drain node-1 --ignore-daemonsets --delete-local-data --force
k run --image=nginx --port=80 --restart=Never nginx
k expose po front-end --name=front-end-service --port=80 --target-port=80 --type=NodePort

k annotate pod nginx-dev{1..3} name=webapp

k set image deploy/webapp nginx=nginx:1.100
k rollout status deploy webapp

k autoscale deploy webapp --min=10 --max=20 --cpu-percent=85
k get hpa

k create job hello-job --image=busybox --dry-run -o yaml -- echo "Hello I am from job"
k create cronjob date-job --image=busybox --schedule="*/1 * * * *" -- bin/sh -c "date; echo Hello from kubernetes cluster"

k create configmap keyvalcfgmap --from-file=config.txt
k create secret generic my-secret --from-literal=username=user --from-literal=password=mypassword
k create sa admin