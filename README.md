*Dependencies*

* Install Docker 
* Install Docker Compose (or Docker Stack)
* Ensure that Docker is running 

Download and save https://github.com/arvindsv/gocd-starter-template-test.git

Open terminal

Navigate to the directory docker-compose.yml is saved in

Try:

```
docker-compose up -d
```

OR

```
docker stack deploy -c docker-compose.yml gocd
```

Access http://localhost:8153
