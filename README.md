# docker-robotframework
Dockerized Robot Framework + Selenium Library + Chrome

## CAUTION
This only work for headless mode in chrome. Best to use with CI/CD environment like Jenkins.

## Features
- Headless mode for chrome. Check [here](https://github.com/semutmerah/sab/blob/master/robotframework/headless-chrome.md) for implementation example with chrome.
- Latest SeleniumLibrary for RobotFramework.
- Latest FakerLibrary for RobotFramework.

## Prerequisites
- [Docker installed on your system](https://docs.docker.com/engine/installation/)

## How To Build Image
- Clone this repository:
  ```
  $ git clone git@github.com:semutmerah/docker-robotframework.git
  ```

- Inside folder repo, run this command to build the image
  ```
  $ docker build -t whatever-name-tag-you-want .
  ```
  
## Run The Image
- After the build is finished, you may want to check it first to make sure the image is successfully created with this command:
  ```
  $ docker images
  ```
  
- The output from above command should be like this (in this case I passed rasyid-robotframework as the name/tag of the image):
  ```
  docker-robotframework (master) $ docker images
  REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
  rasyid-robotframework   latest              e0915c211748        17 minutes ago      963MB
  ```
  
- To run the image, execute this command:
  ```
  $ docker run --name docker-robot -d -v /home/your-username/your-robot-project-name:/home/your-robot-project-name -ti the-name-of-the-image
  ```
  
  The flag -v above, means that we set mount the host folder /home/your-username/your-robot-project-name, to the docker container folder at /home/your-robot-project-name
  
## Run the robot command
- There's two way to execute robot command. One is from outside the container, and another one is from outside container.
- To execute robot command from outside the container, just make sure that container is started. then execute this command:
  ```
  $ docker exec container-name robot testfile.robot
  ```
- to execute robot command from inside the container, simply just attach yourself to the container, then run the robot command inside:
  ```
  $ docker attach container-name
  # After command above, you will be automatically inside the container
  $ robot testfile.robot
  ```

