# docker-compose Icinga stack

docker-compose configuration to start-up an Icinga stack containing
Icinga 2, Icinga Web 2 and Icinga DB.

Ensure you have the latest Docker and docker-compose versions and
then just run `docker-compose -p icinga-playground up` in order to start the Icinga stack.

Icinga Web is provided on port **8080** and you can access the Icinga 2 API on port **5665**.
The default user of Icinga Web is `icingaadmin` with password `icinga`.

## Upgrading from v1.0.0 to v1.1.0

**v1.1.0** deploys Icinga Web 2.9.0 and snapshots of Icinga 2, Icinga DB and Icinga DB Web.

The easiest way to upgrade is to start over, removing all the volumes and
therefore wiping out any configurations you have changed:

`docker-compose down --volumes && docker-compose build --pull && docker-compose -p icinga-playground up -d`
