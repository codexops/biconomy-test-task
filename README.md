# Ping Pong API

## Endpoints
- /ping - Responds with {'pong'}
- /pong - Responds with {'ping'}
- /professional-ping-pong - Responds with {'pong'} 90% of the time
- /amateur-ping-pong - Responds with {'pong'} 70% of the time
- /chance-ping-pong - Responds with {'ping'} 50% of the time and {'pong'} 50% of the time

## Description
This is a simple API to test that the RapidAPI/Mashape API Proxy is working. When you access /ping, the API will return a JSON that contains "pong"

## Test Endpoints
API is live at https://rapidapi.com/user/RapidAlex/package/ping-pong

## Overview
Infrastructure provisioning using terraform
Containerization of node application
Orchestration( Deployent in Kubernetes cluster)

`Note` : Each Directory have it's own README.

### Infrastructure

Infrastructure on AWS in created through Infrastructure as a Code using terraform.

Code is avaibale in `terraform` directory on root.

### Dockerfile
Some of the security practices I have followed:

- I have used base image SHA as a peice of evidence.

- I have use mutli stage DockerFile, In base stage it install production dependencies in seperate folder which in used the in the next stage(avoided dev dependencies).

- Used User `node` which is available in the  base image.

- Removed package manager from the image.

- Used to run the server with `dumb-init`.

- Ran docker image with node user and making the container immmutable.

### Kubernetes Manifest

Kubernets service is available in `k8s` directory.
