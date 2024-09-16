# BASH Scripts

## Summary

Collection of Bash Scripts that have multiple purposes, as the following: 

- /bashscripts_github-F/Find-Scripts: Collection of Scripts using the Command Find


--------------

## Usage

1. Locally from Cloning 
2. Docker Container 

### Local

1. Clone Project From Repo
2. Execute Shell Script from Local Directory

### Docker Container Usage

1. Clone Project From Repo
2. Build Docker Image: 
    - `docker build -t bashscripts_github:latest .` 
3. Run Docker Container: 
    - `docker run --rm -d -it bashscripts_github:latest `
4. Check Docker Container is running and get the ContainerId for bashscripts_github:latest: 
    - `docker ps`
5. Execute Bash inside of Docker Container: 
    - `docker exec -it <container_id> bash`
6. Execute Shell Script from Docker Container
