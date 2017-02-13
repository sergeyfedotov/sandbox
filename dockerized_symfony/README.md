```
docker-compose build
docker-compose up -d
docker cp "$(docker-compose ps -q app)":/srv/vendor ./app
docker cp "$(docker-compose ps -q app)":/srv/var/cache ./app/var
docker-compose run app composer ...
docker-compose run app bin/console ...
```
