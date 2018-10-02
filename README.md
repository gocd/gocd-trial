*Dependencies*

* Install Docker 
* Install Docker Compose (or Docker Stack)
* Ensure that Docker is running 

Download and save https://github.com/arvindsv/gocd-starter-template-test/archive/master.zip

Unzip https://github.com/arvindsv/gocd-starter-template-test/archive/master.zip

Open terminal

Navigate to the gocd-starter-template-test directory 

Try:

```
docker-compose up -d
```

Or

```
docker stack deploy -c docker-compose.yml gocd
```

Access http://localhost:8153
