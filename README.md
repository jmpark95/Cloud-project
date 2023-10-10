-  October 1: Created cloud storage bucket and uploaded index.html using terraform
-  October 3: Set up global external application load balancer, HTTPS, pointed custom DNS domain name(minpark.dev) to load balancer endpoint(Cloud DNS) and added bucket(only index.html page for now) to load balancer's backend
-  October 4: Cloud run serverless nodejs container for firestore database communication. Cloud build setup to automatically deploy from github repo
-  October 5: Placed API Gateway in front of cloud run service + wired frontend to API to retrieve viewcount
-  October 7: Terraform provisioned load balancer, SSL.
-  October 8: Set up Terraform cloud VCS driven workflow
-  October 9: Terraform provisioned firestore db
-  October 10: Set up simple CD flow: Push to main -> Cloud build -> Container registry -> Cloud run
-  Completed terraform automation

   ![Architecture](https://github.com/jmpark95/Cloud-project/assets/118156038/e1e0ec86-acd9-41db-8dfa-5e049ffb7db4)

   \*Todos:

-  View count taking too long to show(~6 seconds?). Edit - turns out the minimum number of instances was set to 0, causing serverless cold start. Changed to 1

-  Securing api

-  Still manually having to add A record to Cloud DNS. Come back to this later

-  Need to build and push the container first in the nodejs service repo, then terraform provision cloud run to create the service, then uncomment the rest of cloudbuild.yml to allow pushes to main to be deployed. If I create the cloud run service(through cloudbuild.yml) first, google_cloud_run_v2_service throws an error. Not sure if right flow? Can't seem to find another way. Tried researching more on terraform cloudbuild_trigger, but still no answer. Come back to this later.

-  Manually uploading openapi.yml file. Terraform seems super complicated with api gateway

-  Firestore doesn't completely get removed when doing Terraform destroy. Seems like a google thing?
