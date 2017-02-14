```
chmod -R 777 app/var/ app/vendor/
docker-compose build
docker-compose up -d
docker-compose exec app composer ...
docker-compose exec app bin/console ...
```
