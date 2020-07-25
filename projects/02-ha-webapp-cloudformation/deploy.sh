#!/bin/bash

echo "Positional Parameters"
echo '$0 = ' $0
echo '$1 = ' $1
echo '$2 = ' $2
echo '$3 = ' $3
echo '$4 = ' $4

create_deploy()
{

 echo "-------<< CREATE DEPLOY >>--------------"
    aws cloudformation create-stack --capabilities CAPABILITY_IAM --stack-name $2 --template-body file://$3 --parameters file://$4 --region=eu-west-1
}


update_deploy()
{
  echo "-------<< UPDATE DEPLOY >>--------------"
    aws cloudformation update-stack --capabilities CAPABILITY_IAM --stack-name $2 --template-body file://$3 --parameters file://$4 --region=eu-west-1
}


delete_deploy()
{
    aws cloudformation delete-stack --capabilities CAPABILITY_IAM --stack-name $1 --region=eu-west-1
}

dummy()
{
     echo "dummy"
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