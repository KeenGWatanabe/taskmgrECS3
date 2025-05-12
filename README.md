# this terraforms one Container for app, IGW (pub subnets) NAT (pte subnets) 
modules/ecs/
├── main.tf [vpc, nat, alb, iam, security] # Primary ECS resources
├── variables.tf     # Input variables
├── outputs.tf       # Output values
└── README.md        # Documentation

# for production will spin up backen S3

# in case module "ecs" cloudwatch error
terraform import module.ecs.module.cluster.aws_cloudwatch_log_group.this[0] "/aws/ecs/nodejs-app-cluster"

# build and push a new Docker image
docker build -t your-app-name .
docker tag your-app-name:latest your-account-id.dkr.ecr.us-east-1.amazonaws.com/your-app-name:latest
docker push your-account-id.dkr.ecr.us-east-1.amazonaws.com/your-app-name:latest

# new deployment in ECS
aws ecs update-service --cluster nodejs-app-cluster --service nodejs-app-service --force-new-deployment

# Manual cleanup sequence:
terraform destroy

# aws console cleanup:  
# ANOTHER TF WITH SEPARATE VPC AND ECS WOULD NOT NEED TO DO BELOW
Delete load balancers
Delete Load Balancing-Target groups

Delete NAT gateways

Release Elastic IPs

Delete subnets / associated network

Delete route tables

Delete internet gateways

Finally delete VPC
