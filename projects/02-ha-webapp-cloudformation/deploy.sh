#!/bin/bash

echo "Positional Parameters"
echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2
echo '$3 = ' $3
echo '$4 = ' $4

stackname=$2
template=$3
parmfile=$4

create_deploy()
{

 echo "-------<< CREATE DEPLOY >>--------------"
    aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name $stackname --template-body file://$template --parameters file://$parmfile --region=eu-west-1
    echo aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name $stackname --template-body file://$template --parameters file://$parmfile --region=eu-west-1
}


update_deploy()
{
  echo "-------<< UPDATE DEPLOY >>--------------"
    aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name $stackname --template-body file://$template --parameters file://$parmfile --region=eu-west-1
}


delete_deploy()
{
     echo "-------<< DELETE STACK >>--------------"
    aws cloudformation delete-stack --stack-name $stackname --region=eu-west-1
}

dummy()
{
     echo "Operation Completed! Thank you for using my Crazy Script!"
} 

while [ "$1" != "" ]; do
   case $1 in
        -c | --create )
                        create_deploy
                        ;;
        -u | --update )
                        update_deploy
                        ;;
        -d | --delete )
                        delete_deploy
                        exit
                        ;;
        * )     dummy
                exit 1
    esac
    shift
done

while [ "$1" != "" ]; do
    case $1 in
        -f | --file )           shift
                                filename=$1
                                ;;
        -i | --interactive )    interactive=1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# ./deploy.sh -c "udagram-dev" "cf-ha-web-infra.yml" "cf-ha-web-infra.parameters.json"