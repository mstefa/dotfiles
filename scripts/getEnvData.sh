#!/bin/bash

#kubectl -n $1 get secret aura-configuration-api -o json

(kubectl -n $1 get cm aura-configuration-api -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]"; kubectl -n $1 get secret aura-configuration-api -o json | jq -r ".data|to_entries|map(\"\(.key)=\(.value|tostring|@base64d)\")|.[]") | sort

