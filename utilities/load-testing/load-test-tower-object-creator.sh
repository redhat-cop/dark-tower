#!/bin/env bash

###########
#
#
# IMPORTANT: Make sure your job DOES NOT deploy unless that is 
# the purpose of your test!
#
#
###########


# Input for load test e.g. git-tags to make projects/job-tempates

DATA_FILE=payload-10-agnosticd-git-tags.txt
DATA_FILE=payload-all-agnosticd-git-tags.txt

VARS_FILE=../../vars/fake-anarchy-call-vars.yml

counter=0

while read tag; 
do
    echo Creating load job ${counter} with git-tag ${tag}
    counter=$((counter+1))
    tower-cli job launch --job-template=job-runner-test \
      -e @../vars/fake-anarchy-call-vars.yml            \
      -e guid=tag-${tag}                                \
      -e scm_tag=${tag} &
  done < ${DATA_FILE}
