
# Alfresco Content Services Community Deployment

## How to use

This is a quick way to use this installer. Please note you need to have [Docker already installed](https://docs.docker.com/engine/install/ubuntu/) and running.

```bash
sudo pip3 install docker-compose
git clone https://github.com/Greencorecr/acs-community-deployment.git
cd acs-community-deployment/docker-compose
sudo ../fix-perms.sh
docker-compose up -d
```

Now, check that all of the containers are up. **proxy** should be down, as it's missing it's certificates. 

Either copy them to volumes/data/certs/conf, or use ```docker-compose run proxy sh```, install openssl with ```apk add openssl``` 

Now you need create a certificate pair, with something like ```openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=newdomain.com" -addext "subjectAltName=DNS:newdomain.com" -newkey rsa:2048 -out fullchain.pem -keyout privkey.pem ```, inside the /etc/nginx/tls directory of the container.

Then get the proxy container up again with:

```bash
docker-compose up proxy -d
```

## Defining resources

This are the default values for Alfresco, which you are suggested to adjust to you environment, by editing the text file ``.env``

```# Alfresco JVM Memory Settings
ALFRESCO_XMX=2g
ALFRESCO_XMS=2g

# Share JVM Memory Settings
SHARE_XMX=1g
SHARE_XMS=1g

# Solr 6 JVM Memory Settings
SOLR_XMX=1g
SOLR_XMS=1g

# Postgres Tuning Settings
# Default: pg_tune with 100 connections, 1GB RAM & 1 CPU
PG_MAX_CONNECTIONS=100
PG_SHARED_BUFFERS=256MB
PG_EFFECTIVE_CACHE_SIZE=768MB
PG_MAINTENANCE_WORK_MEM=64MB
PG_CHECKPOINT_COMPLETION_TARGET=0.7
PG_WAL_BUFFERS=7864kB
PG_DEFAULT_STATISTICS_TARGET=100
PG_RANDOM_PAGE_COST=4
PG_EFFECTIVE_IO_CONCURRENCY=2
PG_WORK_MEM=2621kB
PG_MIN_WAL_SIZE=1GB
PG_MAX_WAL_SIZE=2GB
PG_MAX_WORKER_PROCESSES=1
PG_MAX_PARALLEL_WORKERS_PER_GATHER=1
PG_MAX_PARALLEL_WORKERS=1
```
