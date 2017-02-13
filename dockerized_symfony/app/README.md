```
docker-compose build
docker cp "$(docker-compose ps -q app)":/srv/vendor ./app/vendor
docker-compose up -d
docker-compose run app composer ...
docker-compose run app bin/console ...
```
