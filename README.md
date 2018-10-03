Table of Contents
=================

  * [Dependencies](#dependencies)
  * [Installation](#installation)
 
## Dependencies

* Install Docker 
* Install Docker Compose (or Docker Stack)
* Ensure that Docker is running 

## Installation

Open terminal

Clone the repo, by typing:

```
git clone https://github.com/arvindsv/gocd-starter-template-test.git
```

Navigate to the template directory, by typing: 

```
cd gocd-starter-template-test
```


Start the GoCD server, by typing:

```
docker-compose up -d
```

Or

```
docker stack deploy -c docker-compose.yml gocd
```

The server will start and you will see 


```
Creating gocd-starter-template-test-master_server_1 ... done
Creating gocd-starter-template-test-master_agent_1  ... done

```


Access the server by going to: http://localhost:8153

You may see a "starting" message wait a few minutes for the server and agent to start. 

When finished to bring the server down, by typing:

```
docker-compose down
```
