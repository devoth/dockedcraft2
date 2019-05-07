# Docker container config for Craft CMS 2

> Disclaimer: Since we're using a MySQL "hack" (`db/database-schema/permissions-fix.sql` to allow root access from another docker container, this shouldn't be used on production, only as a local dev machine. If you want to use it on production perhaps create a different mysql user and add other security precautions.

Uses Apache + PHP + MySQL + MySQLAdmin

```bash
docker-compose up
```

Now please download and unpack Craft 2 into `/web` folder.
https://craftcms.com/latest-v2.zip

Can be done via command line

```bash
# log in to docker container
docker exec -it <ID> bash
# download Craft CMS
curl https://craftcms.com/latest-v2.zip --output /var/www/craftcms-v2.zip -L
```

After unzipping Craft, replace database credentials in `web/craft/config/db.php`:
```php
return array(
    'server' => 'database',
    'database' => 'craft',
    'user' => 'root',
    'password' => 'root',
    'tablePrefix' => 'craft',
);
```

Now open http://localhost:8080/admin and proceed with Craft installation.

## Useful links

- [Craft 2 Server Requirements](https://docs.craftcms.com/v2/requirements.html)
- [Craft 2 Installation](https://docs.craftcms.com/v2/installing.html#pre-flight-check)
- 
