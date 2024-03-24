# Dockerize Wavelog.

## Prerequisites:
* Latest Docker on your NAS, [workstation](https://www.docker.com/products/docker-desktop/), whereever)
* a few minutes ;)

## Howto:

### Self-Building 
#### Installing

### Use pre-built image (UPDATING is currently ONLY at dev-branch possible)
1) Get Repo" `git clone https://github.com/int2001/wavelog_docker.git`
2) Get into directory: `cd wavelog_docker/devhub`
4) Launch buildprocess: `docker-compose up -d`
5) Navigate your Browser to [[IP or DNS of your Docker-Host]]:8086
6) Follow the installer. **important**: DB-Hostname is "wavelog-db". Username, Password, Database is all "wavelog". If you want to change that, pse edit the docker-compose.yaml
7) Enjoy Wavelog

If you want to use the docker-compose.yml for tou QNAP/Synology/proxmox/whatever Docker-Machine, simply copypaste it out of **devhub**

### Updating
Go to Admin -> Debug Information and press "Update"-Button

## Stopping
Simply call `docker-compose down wavelog_docker`

## (Re-)Starting:
Call `docker-compose start wavelog_docker`

## Adjustments
* You can move from master to dev at any time simply by editing the `Dockerfile` and changing the Branch at L15 there
