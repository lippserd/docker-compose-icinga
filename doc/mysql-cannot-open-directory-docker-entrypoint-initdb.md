## Deploying as non-root ##

(deployment notes from a user)

I wanted to document a problem and a fix.

Having not defined a version of the images to deploy, effectively defaulting to "latest", the
deployed images might have changed behavior.  It would probably benefit re-use to pin versions that
work and upgrade deliberately as upstream upgrades.

In addition but unrelated, deploying as a nonroot user without permission to the "docker" nor
"docker-compose" apps without "sudo" might be different than the original author did.  For this
reason, my environment might be a source of entropy here.

This was failing:
```
mysql_1           | ls: cannot open directory '/docker-entrypoint-initdb.d/': Permission denied
```

This can be confirmed with a basic "up" of the database itself:
```
    sudo docker-compose -p icinga-playground up mysql
```

a blanket/broad chmod of the path mapped this "/docker-entrypoint-initdb.d" mitigates:
```
    chmod -R ugo+rx  env/mysql
```

### Versions ###

containers:
icinga/icingaweb2:2.11.4
mariadb:10.7

CLI:
docker-compose version 1.28.5, build 24fb474e
 - docker-py 4.4.4
 - CPython 3.7.10
 - OpenSSL OpenSSL 1.1.0l
Docker version 20.10.3, build 55f0773
 - API 1.41
 - go-1.17.1
 - docker engine 20.10.3
 - containerd 1.4.3
 - runc 1.0.0-rc93 hash 31cc25f16f5e
 - docker-init 0.19.0
