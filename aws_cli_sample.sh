#1. start instance
~$ aws ec2 start-instances --instance-ids i-0axxxxxxxxxxxxxxx

#2. stop instance
~$ aws ec2 stop-instances --instance-ids i-0axxxxxxxxxxxxxxx

#3. describe instance
~$ aws ec2 describe-instances --query 'Reservations[].Instances[].[Tags[?Key==`Name`].Value[] | [0], Placement.AvailabilityZone,InstanceType,State.Name]' --output table

#4. memcahced memory usage
# http://serverfault.com/questions/201814/memcached-memory-usage
~$ echo "stats" | nc -w 1 <host> <port> | awk '$2 == "bytes" { print $2" "$3 }'

#5. upload file to S3 bucket
#config bucket correctly first
curl -L -X PUT --header "x-amz-acl: bucket-owner-full-control" -T "<path to compressed file>" "https://uploads-us-west-2.s3.amazonaws.com/<publisher name>/<filename>"
# by html form ref. http://docs.aws.amazon.com/AmazonS3/latest/dev/HTTPPOSTExamples.html


