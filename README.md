# About

A simple Node Docker image which adds Docker and Git to the image in order to use Gitlab-CI. 

Docker Hub: https://hub.docker.com/r/bugkings/node-gitlabci/

Example Gitlab CI Usage:

```
image: bugkings/node-gitlabci

stages:
 - build

services:
  - docker:dind

before_script:
 - docker login -u gitlab-ci-token -p $CI_JOB_TOKEN registry-gitlab.YOUR-DOMAIN.COM
 
build:
  stage: build
  script:
    - npm install
    - npm run build
    - docker build -t YOUR-IMAGE-NAME-HERE -f build/Dockerfile .
    - docker push YOUR-IMAGE-NAME-HERE

```



