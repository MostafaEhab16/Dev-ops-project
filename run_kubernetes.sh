#!/usr/bin/env bash

minikube start

kubectl config view

dockerpath=mostafaehab16/mostafa-hello

kubectl create -f deploy.yml

kubectl run mostafa-hello --image=$dockerpath --port=8080

kubectl expose deployment hello-deployment --type="LoadBalancer"

kubectl get pods 

sleep 15s
#Get application pod name 
POD=$(kubectl get pods |awk '{print$1}' | grep 'mostafa-hello')

#Print pod name
echo $POD 

#Forward pod to specifc port
kubectl port-forward $POD 8080:8080
