# README
This docker depends on the [hadoop][1] image. Make sure you have a
running hadoop container first.

## Build the docker image
```shell
docker build -t hive:latest .
```

## Run the container
```shell
docker run -d --name hive --hostname hive --link hadoop \
  -p 10000:10000 -p 10002:10002 -p 50111:50111 \
  hive:latest --initSchema derby
```

## Connect to the Hive instance

*TODO*


[1]: https://github.com/davidshen84/docker-hadoop-onbuild
