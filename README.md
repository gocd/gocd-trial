*Dependencies*

* Install Docker 
* Install Docker Compose (or Docker Stack)
* Ensure that Docker is running 

Download and save https://github.com/arvindsv/gocd-starter-template-test/archive/master.zip

Unzip https://github.com/arvindsv/gocd-starter-template-test/archive/master.zip

Open terminal

Navigate to the gocd-starter-template-test directory 

To start the GoCD server type:

```
docker-compose up -d
```

Or

```
docker stack deploy -c docker-compose.yml gocd
```

To access the server goto: http://localhost:8153

To bring the server down type:

```
docker-compose down
```
