#!/bin/bash

# scripts/test_access.sh

IP=$(terraform output -raw ec2_public_ip)

echo "Testing allowed port 8000 (should work):"
curl -s --connect-timeout 10 http://$IP:8000 && echo "Success!" || echo "Failed (blocked?)"

echo ""
echo "Testing denied port 9000 (should fail):"
curl -s --connect-timeout 10 http://$IP:9000 && echo "Unexpected success!" || echo "Correctly blocked!"