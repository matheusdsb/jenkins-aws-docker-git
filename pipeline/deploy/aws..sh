#!/bin/bash

echo "*******************************"
echo "** Generating aws subdomain **"
echo "******************************"

export AWS_ACCESS_KEY_ID=${AWS_KEY_ID}

export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_KEY}

aws route53 change-resource-record-sets --hosted-zone-id Z38P02MY7GL1UP --change-batch '{ 
    "Comment": "Testing creating a record set", 
    "Changes": [ 
        { 
            "Action": "CREATE", 
            "ResourceRecordSet": { 
                "Name": "'${SUBDOMAIN_URL}'.'${DOMAIN_URL}'", 
                "Type": "A", 
                "TTL": 300, 
                "ResourceRecords": [ 
                    { "Value": "'${IP_ADDRESS}'" } 
                ] 
            } 
        } 
    ] 
}'; exit 0; 
