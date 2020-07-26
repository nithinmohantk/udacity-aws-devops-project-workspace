

# Udacity - Project 2 - HA Web app provisioning using Cloud Formation 

This project contains the necessary scripts for automating the provisioning of social media web app called 'Udagram'.  

### Architecture 

Architecture of the solution is explained in a diagram below: 

### Prerequisites 


### How to Use

#### Create 
```
./deploy.sh -c "udagram-dev" "cf-ha-web-infra.yml" "cf-ha-web-infra.parameters.json"
```

#### Update
```
./deploy.sh -u "udagram-dev" "cf-ha-web-infra.yml" "cf-ha-web-infra.parameters.json"
```

#### Delete
```
./deploy.sh -d "udagram-dev" "cf-ha-web-infra.yml" "cf-ha-web-infra.parameters.json"
```


