Day 15 Notes..
Goal: Launching a Virtual Machine in the Cloud.

1. EC2 (Elastic Compute Cloud)

It is a resizable compute capacity in the cloud. It's basically a remote computer.

Instance: A single server.

AMI (Amazon Machine Image): The OS template (Ubuntu, Linux, Windows).

2. Key Pairs (.pem)

AWS servers don't use passwords by default. They use Key Pairs.

You must have the private key (.pem file) on your laptop to login.

3. Connection Command

ssh -i my-key.pem ubuntu@public_ip