#!/bin/bash

if kubectl get namespaces >/dev/null 2>&1; then
  namespace=$(kubectl get namespaces | awk '{if (NR!=1) print $1 ": " $2}' | sort | fzf --height 40%)

  if [[ -n $namespace ]]; then
    namespace_id=$(echo "$namespace" | awk -F ': ' '{print $1}')
  echo "hola"
  (kubectl -n "$namespace_id" get cm aura-configuration-api -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]"; kubectl -n "$namespace_id" get secret aura-configuration-api -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring|@base64d)\")|.[]") | sort
  else
    echo "You haven't selected any namespaces! ༼つ◕_◕༽つ"
  fi
else
  echo "kubectl not running! (ಠ_ಠ)"
fi
