\*Need to fix: View count taking too long to show(~6 seconds?), secure api
Todo: Read about serverless cold start. Edit - turns out the minimum number of instances was set to 0, causing this cold start. Changed to 1

-  October 1: Created cloud storage bucket and uploaded index.html using terraform
-  October 3: Set up global external application load balancer, HTTPS, pointed custom DNS domain name(minpark.dev) to load balancer endpoint(Cloud DNS) and added bucket(only index.html page for now) to load balancer's backend
-  October 4: Cloud run serverless nodejs container for firestore database communication. Cloud build setup to automatically deploy from github repo
-  October 5: Placed API Gateway in front of cloud run service + wired frontend to API to retrieve viewcount
-  October 7: Terraform provisioned load balancer, SSL
-  October 8: Set up Terraform cloud VCS driven workflow
   ![Architecture](https://github.com/jmpark95/Cloud-project/assets/118156038/e1e0ec86-acd9-41db-8dfa-5e049ffb7db4)
