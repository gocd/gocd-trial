# GoCD Trial Docker template 

Table of Contents
=================

  * [How to use](#how-to-use)
  * [Dependencies](#dependencies)
  * [Installation](#installation)
  * [Use](#use)
  * [Shutdown](#shutdown)
  * [License](#license) 
 
## How to use 

This template is intended to be used to trial GoCD. It is *not* intended for production use. 

Once you start the GoCD server it will show you example pipelines as well as execution data and analytics.

Use this template in combination with the [GoCD documentation](https://www.gocd.org/getting-started/part-1/) to understand more about how GoCD can be configured and used to meet your needs. 

If you need support while trying GoCD feel free chat to us on [Gitter](https://gitter.im/gocd/gocd) or join our [Google Group](https://groups.google.com/forum/#!forum/go-cd).


## Dependencies

* Install Git 
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

You may see a "starting" message, if so, wait a few minutes for the server and agent to start. Once the server is ready to try you will see an example pipeline. 

![GoCD Trial](/images/GoCD_Docker_Template_image_1.png)

## Use 

This GoCD server has been configured using GoCD's [config as repo feature](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html). The configuration is located in this repository. 

To change the configuration of the server

* cd into your local copy of the cloned repo
* git clone http://localhost:8155/git/config-repo.git/ 
* update the files named xxxx.gopipeline.json to reconfigure the server
* commit and push the updated files 

The build_test pipeline has been configured to use this repository as the [material] (https://docs.gocd.org/current/configuration/quick_pipeline_setup.html). 

To kick off the pipelines in this configuration 

* touch tmp.txt ; git add tmp.txt
* commit to your locally cloned repository  

## Shut down

When finished trying GoCD to bring the server down, by typing:

```
docker-compose down
```

## License

```plain
Copyright 2018, ThoughtWorks, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
