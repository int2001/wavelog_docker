# Dockerize Wavelog.

## prerequisites:
* Latest Docker on your NAS, [workstation](https://www.docker.com/products/docker-desktop/), whereever)
* a few minutes ;)

## Howto:

### Self-Building (Recommended way!)
#### Installing
1) Get Repo" `git clone https://github.com/int2001/wavelog_docker.git`
2) Get into directory: `cd wavelog_docker`
3) Launch buildprocess: `docker-compose up -d`
4) Navigate your Browser to [[IP or DNS of your Docker-Host]]:8086
5) Follow the installer. **important**: DB-Hostname is "wavelog-db". Username, Password, Database is all "wavelog". If you want to change that, pse edit the docker-compose.yaml
6) Enjoy Wavelog

Branch is current master.

### Use pre-built image (Currently NO UPDATING possible)
1) Get Repo" `git clone https://github.com/int2001/wavelog_docker.git`
2) Get into directory: `cd wavelog_docker`
3) Get into directory "hub" for latest master: `cd hub` OR into "devhub" for latest dev: `cd devhub`
4) Launch buildprocess: `docker-compose up -d`
5) Navigate your Browser to [[IP or DNS of your Docker-Host]]:8086
6) Follow the installer. **important**: DB-Hostname is "wavelog-db". Username, Password, Database is all "wavelog". If you want to change that, pse edit the docker-compose.yaml
7) Enjoy Wavelog

If you want to use the docker-compose.yml for tou QNAP/Synology/proxmox/whatever Docker-Machine, simply copypaste it out of **hub** or **devhub**

### Updating
1) Stop Wavelog-Containers (wavelog-db and wavelog-main)
2) delete **only** wavelog-main _Container_
3) delete **only** wavelog-main _Image_
4) Launch buildprocess `docker-compose up -d` while standing in Repo-Folder (No need to repull repo) // Docker now pulls the latest Wavelog-Version from github. All Userdata should be preserved automagically

## Stopping
Simply call `docker-compose down wavelog_docker`

## (Re-)Starting:
Call `docker-compose start wavelog_docker`

## Adjustments
* You can move from master to dev at any time simply by editing the `Dockerfile` and changing the Branch at L15 there
