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
   git clone <repository-url>
   cd <repository-directory>

## Building the Docker Image

To build the Docker image, use the following command:

```sh
sudo docker build -t my_image .

