# docker-compose Icinga stack

docker-compose configuration to start-up an Icinga stack containing
Icinga 2, Icinga Web 2 and Icinga DB.

Ensure you have the latest Docker and docker-compose versions and
then just run `docker-compose -p icinga-playground up` in order to start the Icinga stack.

Icinga Web is provided on port **8080** and you can access the Icinga 2 API on port **5665**.
The default user of Icinga Web is `icingaadmin` with password `icinga` and
the default user of the Icinga 2 API for Web is `icingaweb` with password `icingaweb`.

### Use with podman

Environment:
 * ``podman version 4.0.2``
 * ``docker-compose version 1.29.2, build 5becea4c``

Ensure you have started the podman socket and set the environment variable
````bash
systemctl enable podman.socket --now
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
echo "export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock" >> ~/.bashrc
````

Furthermore you need an older docker-compose version (because of compability to [podman](https://github.com/containers/podman/issues/11822)):
````bash
wget https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64 -O /usr/local/sbin/docker-compose1.29.2
````

#### Podman Rootless

To use the container rootless, you have to create the user environent first
````bash
useradd -m -c "User for icinga containers" pod_icinga
sudo -iu pod_icinga
echo 'export XDG_RUNTIME_DIR="/run/user/$UID"' >> ~/.bashrc
echo 'export DBUS_SESSION_BUS_ADDRESS="unix:path=${XDG_RUNTIME_DIR}/bus"' >> ~/.bashrc
echo "export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock" >> ~/.bashrc
````

Enable lingering for user (**as root**). If you forget this step, the containers will be stopped if the user logs out.
````bash
loginctl enable-linger pod_icinga_cluster
````

To start the container use now the following command:
````bash
# Change directory to the git_clone
/usr/local/sbin/docker-compose1.29.2 up -d
````


## Upgrading from v1.1.0 to v1.2.0

**v1.2.0** deploys Icinga Web ≥ 2.11.0, Icinga 2 ≥ 2.13.4, Icinga DB ≥ 1.0.0 and Icinga DB Web ≥ 1.0.0.
The Icinga Director is also set up and its daemon started, all in a separate container.

The easiest way to upgrade is to start over, removing all the volumes and
therefore wiping out any configurations you have changed:

`docker-compose -p icinga-playground down --volumes && docker-compose pull && docker-compose -p icinga-playground up --build -d`


## Upgrading from v1.0.0 to v1.1.0

**v1.1.0** deploys Icinga Web 2.9.0 and snapshots of Icinga 2, Icinga DB and Icinga DB Web.

The easiest way to upgrade is to start over, removing all the volumes and
therefore wiping out any configurations you have changed:

`docker-compose down --volumes && docker-compose build --pull && docker-compose -p icinga-playground up -d`

