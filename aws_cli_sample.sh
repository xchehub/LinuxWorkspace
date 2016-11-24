#1. start instance

#2. stop instance

#3. describe instance
aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[] | [0], Placement.AvailabilityZone,InstanceType,State.Name]' --output table
