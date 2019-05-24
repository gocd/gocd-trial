# Deprecation notice

This repository is deprecated. Please see: https://github.com/gocd-contrib/gocd-trial-launcher instead.

# GoCD Test Drive

Table of Contents
=================

  * [How to use](#how-to-use)
  * [Dependencies](#dependencies)
  * [Installation](#installation)
  * [Use GoCD](#use-gocd)
  * [Next steps](#next-steps)
  * [Shutdown](#shutdown)
  * [Feedback](#feedback)
  * [License](#license)

# How to use

This trial is intended to be used to quickly and easily try out GoCD. It is *not* intended for production use.

Once you start the GoCD trial it will show you example pipelines as well as execution data and value stream maps. You will also be able to edit the configuration and run builds.

Use this trial in combination with the [GoCD documentation](https://www.gocd.org/getting-started/part-1/) to understand more about GoCD's capabilities.

If you need support while trying GoCD feel free chat to us on [Gitter](https://gitter.im/gocd/gocd) or join our [Google Group](https://groups.google.com/forum/#!forum/go-cd).

# Dependencies

* Install Git
* Install Docker
* Install Docker Compose
* Ensure that Docker is running

**Note: This trial does not currently work on Docker for Windows**

# Installation

Open terminal

Clone the repo, by typing:

```
git clone https://github.com/gocd/gocd-trial.git
```

Navigate to the template directory, by typing:

```
cd gocd-trial
```
**Note:** If you are running it on a virtual machine or inside a Docker container, you will need to update /data folder permission under gocd-trial directory to avoid any permission related [issue](https://github.com/gocd/gocd-trial/issues/11). Run `chmod -R o+w data/` before starting the server.

Start the GoCD server, by typing:

```
docker-compose up -d
```

This starts 3 docker containers that are hosting:
- GoCD server
- GoCD agent
- git server (which is hosting "repo1" that contains the GoCD config and materials for this trial)

You will see:


```
Creating network "gocd-trial_default" with the default driver
Creating gocd-trial_gitserver_1 ... done
Creating gocd-trial_server_1    ... done
Creating gocd-trial_agent_1     ... done
```

Access the server by going to: http://localhost:8153

You may see a "starting" message, if so, wait a few minutes for the server and agent to start. Once the server is ready to try you will see a few example pipelines. These pipelines have been configured using GoCD's [pipelines as code feature](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html).

![GoCD Trial](/images/GoCD_Docker_Template_image_1.png)

# Use GoCD

Now would be a good time to take a look at [Introduction to GoCD](https://www.gocd.org/getting-started/part-1/) to understand what you are looking at.

## Value stream map

You can view a value stream map of these pipelines at http://localhost:8153/go/pipelines/value_stream_map/deploy/1

## Run builds

You can make a change to the [materials](https://docs.gocd.org/current/introduction/concepts_in_go.html#materials) in the git repo to kick off the builds and see the pipeline progress.

Note: As these pipelines are configured using GoCD's [pipelines as code feature](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html), you won't be able to change the material configuration from the GoCD dashboard. You will need to change the materials by changing the configuration in the repository. Refer to [updating the configuration](https://github.com/gocd/gocd-trial#update-the-configuration) if you would like to do this.

To run builds first checkout the material repository, by typing:

```
cd gocd-trial
```
```
git clone http://localhost:8155/git/repo1.git/
```

Next navigate to the repo and make a change, by typing:

```
cd repo1
```
```
touch tmp.txt
```
```
git add tmp.txt
```
```
git commit -m "first commit"
```
```
git push
```
Once you push the commit, you will see "build_test" pipeline gets triggered and start building. Later, all the other downstream pipelines will get triggered as they are configured as [pipeline dependencies](https://docs.gocd.org/current/configuration/managing_dependencies.html).


## Update the configuration

The GoCD server has been configured using GoCD's [pipelines as code feature](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html). The configuration is located in this repository.

To update the configuration, navigate to the repo, by typing:

```
cd gocd-trial
```
```
cd repo1
```

Then open the configuration file, by typing:

```
open deploy.gopipeline.json
```

Change the configuration and add a new stage to the deploy pipeline by *replacing **only the stages section** of this file from:*

```javascript
"stages": [
   {
     "name": "ready_to_deploy_stage",
     "fetch_materials": true,
     "never_cleanup_artifacts": false,
     "clean_working_directory": false,
     "environment_variables": [],
     "jobs": [
       {
         "name": "ready_to_deploy_job",
         "environment_variables": [],
         "tabs": [],
         "resources": [],
         "artifacts": [],
         "properties": [],
         "run_instance_count": null,
         "timeout": 0,
         "tasks": [
           {
             "type": "exec",
             "command": "ls"
           }
         ]
       }
     ]
   },
   {
     "name": "deploy_stage",
     "fetch_materials": true,
     "never_cleanup_artifacts": false,
     "clean_working_directory": false,
     "environment_variables": [],
     "approval": {
       "type": "manual",
       "roles": [],
       "users": []
     },
     "jobs": [
       {
         "name": "deploy_job",
         "environment_variables": [],
         "tabs": [],
         "resources": [],
         "artifacts": [],
         "properties": [],
         "run_instance_count": null,
         "timeout": 0,
         "tasks": [
           {
             "type": "exec",
             "command": "ls"
           }
         ]
       }
     ]
   }
 ]
```

to be:

```javascript
"stages": [
    {
      "name": "a_new_stage",
      "fetch_materials": true,
      "never_cleanup_artifacts": false,
      "clean_working_directory": false,
      "environment_variables": [],
      "jobs": [
        {
          "name": "a_new_stage_job",
          "environment_variables": [],
          "tabs": [],
          "resources": [],
          "artifacts": [],
          "properties": [],
          "run_instance_count": null,
          "timeout": 0,
          "tasks": [
            {
              "type": "exec",
              "command": "ls"
            }
          ]
        }
      ]
    },
    {
      "name": "ready_to_deploy_stage",
      "fetch_materials": true,
      "never_cleanup_artifacts": false,
      "clean_working_directory": false,
      "environment_variables": [],
      "jobs": [
        {
          "name": "ready_to_deploy_job",
          "environment_variables": [],
          "tabs": [],
          "resources": [],
          "artifacts": [],
          "properties": [],
          "run_instance_count": null,
          "timeout": 0,
          "tasks": [
            {
              "type": "exec",
              "command": "ls"
            }
          ]
        }
      ]
    },
    {
      "name": "deploy_stage",
      "fetch_materials": true,
      "never_cleanup_artifacts": false,
      "clean_working_directory": false,
      "environment_variables": [],
      "approval": {
        "type": "manual",
        "roles": [],
        "users": []
      },
      "jobs": [
        {
          "name": "deploy_job",
          "environment_variables": [],
          "tabs": [],
          "resources": [],
          "artifacts": [],
          "properties": [],
          "run_instance_count": null,
          "timeout": 0,
          "tasks": [
            {
              "type": "exec",
              "command": "ls"
            }
          ]
        }
      ]
    }
  ]
```

Return to terminal, type:

```
git add deploy.gopipeline.json
```
```
git commit -m "updated configuration"
```
```
git push
```
If you return to http://localhost:8153 you will see that the pipeline "deploy" now has three stages.

Also as the build_test pipeline has been configured to use this repository as the [material](https://docs.gocd.org/current/configuration/quick_pipeline_setup.html) you will also see that the other pipelines are now running.

Note: This might take couple of minutes to update on GoCD at http://localhost:8153.

# Next steps

This GoCD trial has given you a quick, yet limited introduction to GoCD.

If you would like to understand more about the capabilities of GoCD and try them out on your own project we recommend downloading and [installing GoCD](https://www.gocd.org/download) and following our complete [introduction](https://www.gocd.org/getting-started/part-1/) to setting up your own GoCD server.

Note: If you made changes to the GoCD trial configuration that you would like to retain and use on your local GoCD server please configure your local server to use the [pipelines as code](https://docs.gocd.org/current/advanced_usage/pipelines_as_code.html) feature and copy the .json files from the repo1 created as part of the trial to your own repo.

# Shutdown

When finished trying GoCD bring the server down, by typing:

```
docker-compose down
```

# Feedback 

We want this trial of GoCD to be quick and easy to use. If it was not, or you can see a way to improve it, please submit an issue or chat to us on [Gitter](https://gitter.im/gocd/gocd) or join our [Google Group](https://groups.google.com/forum/#!forum/go-cd).

# License

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
