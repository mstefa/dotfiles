#!/bin/bash

# Define the namespaces and deployments
namespaces=("aura-ap-four" "aura-ap-four" "aura-ap-four" "aura-ap-four" "aura-ap-four" "aura-ap-four")
deployments=("authentication-api" "aura-configuration-api" "api-gw" "context" "kgb-server" "aura-bridge")
ports=("3000" "8999" "9000:80" "10000" "8888:8888" "8045:8045")

# Loop through the deployments and port-forward
for i in "${!deployments[@]}"; do
  namespace="${namespaces[$i]}"
  deployment="${deployments[$i]}"
  port="${ports[$i]}"
  
  echo "Port-forwarding deployment $deployment in namespace $namespace on port(s) $port..."
  
  # Run the kubectl port-forward command
  kubectl port-forward --namespace="$namespace" "deployments/$deployment" "$port" &
  
  # Sleep for a short time to allow the port-forwarding to start before moving to the next one
  sleep 2
done

# Wait for user to stop the port-forwarding (Ctrl+C)
echo "Press Ctrl+C to stop port-forwarding..."

# Keep the script running to allow manual interruption
while true; do
  sleep 1
done
