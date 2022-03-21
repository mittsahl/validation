#!/bin/bash

RUNNING=$(aws ec2 describe-instances --output text | grep "STATE   48")
if [ -z "$RUNNING" ]
then
	echo No instances Creating Instance...
	echo q | aws ec2 run-instances --image-id ami-0fb653ca2d3203ac1 --count 1 --instance-type t2.micro --key-name awesome-key --security-group-ids sg-06e22470af753cf71 --subnet-id subnet-0ce06460c4a6baf40 --output json
	SECONDS=0
	while [ $SECONDS -le 15 ]
	do	
		echo $SECONDS
		$SECONDS=$((SECONDS + 1))
		sleep 1
	done
	PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids $(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId') --query 'Reservations[].Instances[].PublicDnsName')
	echo $PUBLIC_DNS
	SSH_CODE=$(ssh -i awesome-key.pem ubuntu@$PUBLIC_DNS) > /dev/null 2>&1
	if [ $SSH_CODE -e 0 ]
	then
		echo SSH failed
	else
		echo $PUBLIC_DNS
	fi
else
	echo Server up and running
fi
