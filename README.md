# Dockerize Wavelog.

## Prerequisites:
* Latest Docker on your NAS, [workstation](https://www.docker.com/products/docker-desktop/), whereever)
* a few minutes ;)

## Howto:

### Self-Building 
#### Installing

### Use pre-built image (UPDATING is currently ONLY possible via "In-App-Updater" - at Admin -> Debug)
1) Get Repo" `git clone https://github.com/int2001/wavelog_docker.git`
2a) Get into directory: `cd wavelog_docker/devhub` for latest dev "edge"
2b) Get into directory: `cd wavelog_docker/prodhub` for latest Master-Release "latest"
4) Launch buildprocess: `docker-compose up -d`
5) Navigate your Browser to [[IP or DNS of your Docker-Host]]:8086
6) Follow the installer. **important**: DB-Hostname is "wavelog-db". Username, Password, Database is all "wavelog". If you want to change that, pse edit the docker-compose.yaml
7) Enjoy Wavelog

If you want to use the docker-compose.yml for tou QNAP/Synology/proxmox/whatever Docker-Machine, simply copypaste it out of **devhub** or **prodhub**

### Updating
Go to Admin -> Debug Information and press "Update"-Button

**Important**: Currently updating of ONLY the image (the docker-way) is not supported. I'm working on it

## Stopping
Simply call `docker-compose down wavelog_docker`

## (Re-)Starting:
Call `docker-compose start wavelog_docker`

## Adjustments
* You can move from master to dev at any time simply by editing the `Dockerfile` and changing the Branch at L17 there

## Default cronjobs
Big tnx to @jk13xyz for the idea.

The following cronjobs are set by default through the Dockerfile They don't need to be manually enabled. They can be updated, but this is a hassle. I use these settings because they made the most sense to me. The spacing is done to ensure the scripts don't run concurrently and cause time-outs.

The set cronjobs and runtimes are:

### ClubLog upload

Every day at 00:00 and 12:00

### QRZ upload

Every day at 00:10 and 12:10

### QRZ download

Every day at 00:20 and 12:20

### eQSL sync

Every day at 00:30 and 12:30

### HRDLog upload

Every day at 00:40 and 12:40

### LotW upload

Every day at 01:00

### LotW user database update

Every day at 01:10

### ClubLog Super Check Partial

Every Monday at 01:20

### Summits on the Air (SOTA) database update

On the 1st of every month at 02:00

### World Wide Flora & Fauna (WWFF) databse update

On the 1st of every month at 02:10

### Parks on the Air (POTA) database update

On the 1st of every month at 02:20

### DOK database update

On the 1st of every month at 03:00
