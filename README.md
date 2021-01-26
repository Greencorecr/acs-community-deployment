
# Alfresco Content Services Community Deployment

## How to use

This is a quick way to use this installer. Please note you need to have Docker already installed and running.

```bash
sudo pip3 install docker-compose
git clone git@github.com:Greencorecr/acs-community-deployment.git
cd acs-community-deployment/docker-compose
sudo ../fix-perms.sh
docker-compose up -d
```

Now, check that all of the containers are up. **proxy** should be down, as it's missing it's certificates. Either copy them to volumes/data/certs/conf, or use ```docker-compose run proxy sh```, install openssl with ```apkg add openssl``` and create a certificate pair.

Then get the proxy container up again with:

```bash
docker-compose up proxy -d
```

