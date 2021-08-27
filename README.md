#Steps to reproduce
- git clone https://github.com/vikramnagaraju31/cnast.git -b develop
- Create your own repo on github
- Create develop branch for newly created repo
- Add secrets, Please refer image/GIT_secret_configuration.png
- Push cloned source code to newly created github repo develop branch
- Git hub workflow triggers automatically.
- Switch to actions tab, Select latest workflow to view the steps, Please refer image/GITHUB_Workflow_Actions.png
- Once workflow is completed successfully, Please login to your console and you should be able to see eks-condenast-cluster on EKS service.
- Please make sure you have aws-cli and kubectl installed.
- aws eks --region us-east-1 update-kubeconfig --name eks-condenast-cluster
- kubectl get namespace
- kubectl -n condenast get pods
- You should be able to see 2 pods running, Please refer images/Deployment.png
- kubectl -n condenast get svc
- You should be able to see 1 load bakancer service running, Please refer images/Deployment.png
- Copy EXTERNAL-IP, Please refer images/Deployment.png
- Host on browser http://<EXTERNAL-IP>:8080/, you should be able to see Hello world. Please refer images/Browser.png

#To Configure Logs
- Deploy FluentD and Cloud watch metrics agents on eks-condenast-cluster nodes
- Attach CloudWatchLogsFullAccess policy to eks-condenast-cluster node role 
- Go to Services -> CloudWatch -> Click on Overview -> Container Insights
- Go to Services -> CloudWatch -> Log groups -> Click on desired log group with cluster name -> Click on desired log stream with deployment name to view logs
- Create own cloud watch dashboard for metrics and log groups using cloud watch query.

