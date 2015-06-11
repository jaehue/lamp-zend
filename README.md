
## Usage

### docker build

```
$ docker build --force-rm=true -t lamp-zend .
```

### docker run

```
$ docker run -d -p 80:80 -p 3306:3306 \
  -e MYSQL_PASS="password" \
  -v $(pwd)/app:/app \
  lamp-zend
```

## Zend framework

