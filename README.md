
## Usage

### docker build

```
$ docker build --force-rm=true -t lamp_zend .
```

### docker run

```
$ docker run -d -p 80:80 -p 3306:3306 \
  -e MYSQL_PASS="password" \
  -v $(pwd)/app:/home/app \
  lamp_zend
```

## Zend framework

