
[![CircleCI](https://circleci.com/gh/nithinmohantk/udacity-aws-devops-project-workspace/tree/master.svg?style=svg)](https://circleci.com/gh/nithinmohantk/udacity-aws-devops-project-workspace/tree/master)

# Cloud DevOps Engineer Nanodegree - Operationalize a Machine Learning Microservice API

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

## How to Use
### Running Application

#### 1. Running application as standalone
```bash
#Setup a python virtual environment and activate it
python -m venv ~/.devops
source ~/.devops/bin/activate

#Install the dependencies 
make install 

#Execute the Application
python app.py 

```

#### 2. Run in local Docker 
```bash
# Setup Docker CE for Windows/Mac 

# Run the docker specific shell script :
__`./run_docker.sh`__

```

#### 3. Publish docker image to DockerHub 
```bash
# to publish the docker image to DockerHub repository:
`./run_docker.sh ${USERNAME}`

${USERNAME} -- is your dockerhub account 

Example:
`./run_docker.sh thingxcloud`  - is the command for running against my dockerhub account 

My dockerhub instance can be accessed: https://hub.docker.com/repository/docker/thingxcloud/udacity-boston-housing

```

#### 4. Run in Local Kubernetes Cluster 
```bash
# Run the application in your minikube or kind local cluster . In my case I used *kind*, as it is lightweight and simpler to implement single node development k8s clusters.

`./run_kubernetes.sh`  
```

#### 5. Run prediction for housing prices 

```bash
# Once you have local instance is up and running say 'udacity-boston-housing' 

Execute `./make_prediction.sh` to verify the api calls to the container or pods instance. 
```


## Project Files 

* __app.py:__ The Flask application 
* __requirements.txt:__ Prerequisites of Python packages for Flask app
* __model_data/boston_housing_prediction.joblib:__ Pretrained sklearn model to be used by the flask app
* __Dockerfile:__ Instructions of how to build our application container
* __Makefile:__ Commands to setup, install and linting the applicaiton
* __run_docker.sh:__ Builds and runs the docker container
* __run_kubernetes.sh:__ Runs Flask app as a pod in kubernetes
* __make_prediction.sh:__ Makes POST api request to running Flask app to make a prediction
* __upload_docker.sh:__ Tags and uploads the Docker image to DockerHub
* __output_txt_files/docker_out.txt:__ Console output from running run_docker.sh and make_prediction.sh
* __output_txt_files/kubernetes_out.txt__ Console output from running run_kubernetes.sh and make_prediction.sh
* __.circleci/config.yml:__ circleCI build and deployment config
* __screenshots:__ contains necessary logs and screenshot images captured from the exercise.

## References
### Detailed -   Project Tasks from Nanodegree program for your reference

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

### Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

* Setup and Configure Docker locally
* Setup and Configure Kubernetes locally
* Create Flask app in Container
* Run via kubectl
