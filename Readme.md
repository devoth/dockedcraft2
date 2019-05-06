# Docker container config for Craft CMS 2

Uses Apache + PHP + MySQL + MySQLAdmin

```bash
docker-compose up
```

Craft 2 should be installed in `/web` folder.
https://craftcms.com/latest-v2.zip

Can be done via command line

```bash
# log in to docker container
docker exec -it <ID> bash
# download Craft CMS
curl https://craftcms.com/latest-v2.zip --output /var/www/craftcms-v2.zip -L
```

then unzip it


## Useful links

- [Craft 2 Server Requirements](https://docs.craftcms.com/v2/requirements.html)
- [Craft 2 Installation](https://docs.craftcms.com/v2/installing.html#pre-flight-check)
- 
