-  October 1: Created cloud storage bucket and uploaded index.html using terraform
-  October 3: Set up global external application load balancer, HTTPS, pointed custom DNS domain name(minpark.dev) to load balancer endpoint(Cloud DNS) and added bucket(only index.html page for now) to load balancer's backend
-  October 4: Cloud run serverless nodejs container for firestore database communication. Cloud build setup to automatically deploy from github repo
-  October 5: Placed API Gateway in front of cloud run service + wired frontend to API to retrieve viewcount
-  October 7: Terraform provisioned load balancer, SSL.
-  October 8: Set up Terraform cloud VCS driven workflow
-  October 9: Terraform provisioned firestore db
-  October 10: Set up simple CD flow: Push to main -> Cloud build -> Container registry -> Cloud run

![Architecture](https://github.com/jmpark95/Cloud-project/assets/118156038/155f9826-b696-404a-bcd3-c64b90b7cedf)

   \*Need to work on:

-  View count taking too long to show(~6 seconds?). Edit - turns out the minimum number of instances was set to 0, causing serverless cold start. Changed to 1

-  Secure api

-  Still manually having to add A record to Cloud DNS. Come back later to automate

-  google_cloud_run_v2_service image needs to be in place before provisioning. Need to set up nodejs service, push the image to container registry(cloudbuild.yaml) first, then terraform apply to create cloud run, then uncomment cloudbuild to allow gitops continuous deployment, which will then successfuly deploy any changes made to github repo. Not sure if right flow? Can't seem to find another way. Tried researching more on terraform cloudbuild_trigger, but still no answer. Come back to this later.

-  terraform destroy, then apply again - firestore database already exists
