modules/ecs/
├── main.tf [vpc, alb, iam, security] # Primary ECS resources
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── README.md        # Documentation

# build and push a new Docker image
docker build -t your-app-name .
docker tag your-app-name:latest your-account-id.dkr.ecr.us-east-1.amazonaws.com/your-app-name:latest
docker push your-account-id.dkr.ecr.us-east-1.amazonaws.com/your-app-name:latest

# new deployment in ECS
aws ecs update-service --cluster nodejs-app-cluster --service nodejs-app-service --force-new-deployment

Manual cleanup sequence:

Delete load balancers

Delete NAT gateways

Release Elastic IPs

Delete subnets

Delete route tables

Delete internet gateways

Finally delete VPC
