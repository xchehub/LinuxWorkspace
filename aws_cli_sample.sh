#1. start instance
aws ec2 start-instances --instance-ids i-0axxxxxxxxxxxxxxx
#2. stop instance
aws ec2 stop-instances --instance-ids i-0axxxxxxxxxxxxxxx
#3. describe instance
aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[] | [0], Placement.AvailabilityZone,InstanceType,State.Name]' --output table
