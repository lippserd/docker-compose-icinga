# docker-compose Icinga stack

docker-compose configuration to start-up an Icinga stack containing
Icinga 2, Icinga Web 2 and Icinga DB.

Ensure you have the latest Docker and docker-compose versions and
then just run `docker-compose -p icinga up` in order to start the Icinga stack.

Icinga Web is provided on port **8080** and you can access the Icinga 2 API on port **5665**.
The default user of Icinga Web is `icingaadmin` with password `icinga`.
