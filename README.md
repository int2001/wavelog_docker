# Dockerize Wavelog.

## prerequisites:
* Latest Docker on your NAS, [workstation](https://www.docker.com/products/docker-desktop/), whereever)
* a few minutes ;)

## Howto:

### Installing
1) Get Repo" `git clone https://github.com/int2001/wavelog_docker.git`
2) Get into directory: `cd wavelog_docker`
3) Launch buildprocess: `docker-compose up -d`
4) Navigate your Browser to [[IP or DNS of your Docker-Host]]:8086
5) Follow the installer. **important**: DB-Hostname is "wavelog-db". Username, Password, Database is all "wavelog". If you want to change that, pse edit the docker-compose.yaml
6) Enjoy Wavelog

Branch is current master.

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
