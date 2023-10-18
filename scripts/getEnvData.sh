#!/bin/bash

if kubectl get namespaces > /dev/null 2>&1; then

  namespace=$(kubectl get namespaces | awk '{if (NR!=1) print $1 ": " $(NF)}' | fzf --height 40%)

  namespace_name=$(echo "$namespace" | awk -F ': ' '{print $1}')
  echo "you have chosen namespace: " $namespace_name

  if kubectl get namespaces > /dev/null 2>&1; then

    # pod=$(kubectl get pods --namespace="$namespace_name" | awk '{if (NR!=1) print $1 ": " $(NF)}' | fzf --height 40%)
    echo 'kubectl --namespace=' "$namespace_name" 'get cm '
    cms=$(kubectl --namespace="$namespace_name" get cm | fzf --height 40%)
    echo "you have chosen pod: " $cms

    cm_name=$(echo "$cms" | awk -F ' ''{print $1}')

    echo "you have chosen cm_name: " $cm_name
    (kubectl -n "$namespace_name" get cm "$cm_name" -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]"; kubectl -n aura-ap-seven get secret authentication-api -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring|@base64d)\")|.[]") | sort


  else
  echo "Any ConfigMap was found with this name"
  fi

else
  echo "Any namespaces was found"
fi


# kubectl -n aura-ap-four get cm aura-bot -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]"; kubectl -n aura-ap-four get secret aura-bot -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring|@base64d)\")|.[]"
