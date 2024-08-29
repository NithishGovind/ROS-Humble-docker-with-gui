# ROS Humble Docker Container

This repository contains a Docker setup for running ROS Humble with GUI applications. It includes commands for building and running the Docker container, and how to use it effectively.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Building the Docker Image](#building-the-docker-image)
- [Running the Docker Container](#running-the-docker-container)
- [Running with GUI](#running-with-gui)
- [Troubleshooting](#troubleshooting)
- [License](#license)

## Prerequisites

Before using this Docker container, ensure you have the following installed on your host system:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- `sudo` privileges or root access (for Docker commands)
- (Optional) X11 server if running GUI applications

## Setup

1. **Clone the Repository:**

   Clone this repository to your local machine:
   ```sh
   git clone https://github.com/NithishGovind/ROS-Humble-docker-with-gui.git
   cd ROS-Humble-docker-with-gui

2. **Building the Docker Image**

    To build the Docker image, use the following command:

    ```sh
    sudo docker build -t my_image .

3. **Running the Docker Container**

    To start a Docker container with the ROS setup, use:
    ```sh 
    sudo docker run -it --user ros --network=host --ipc=host -v $PWD:/my_source my_image

- --user ros: Runs the container as the ros user.
- --network=host: Uses the host network stack.
- --ipc=host: Shares IPC namespace with the host.
- -v $PWD:/my_source: Mounts the current directory to /my_source in the container.
- my_image: The Docker image to run.

4. **Running with GUI**
    To run the container with GUI support, you need to share the X11 socket with the container. Use the following command:
    ``sh 
    sudo docker run -it --user ros --network=host --ipc=host -v $PWD:/my_source -v /tmp/.X11-unix:/tmp/.X11-unix:rw --env=DISPLAY my_image ros2 topic list

## Troubleshooting
**Permission Issues:**

Ensure you have the necessary permissions to access Docker. If you encounter permission errors, try running the commands with sudo.

**GUI Issues:**

If GUI applications do not display correctly, ensure that the X11 server is running on your host and that you have the correct DISPLAY environment variable set.

**Network Issues:**

If you encounter network issues, ensure that Docker's network settings are correctly configured and that the --network=host option is appropriate for your use case.


### Summary:
- **Building the Docker Image:** Shows the command to build the Docker image and the purpose of the command.
- **Running the Docker Container:** Provides the command to run the container with explanations of the flags used.
- **Running with GUI:** Details the command for running the container with GUI support and explanations for each flag.
- **Troubleshooting:** Offers guidance on how to address common issues related to permissions, GUI, and network configurations.

