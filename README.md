# Docker GUI App 

This Docker example is set up to create a Docker container that runs a simple graphical user interface (GUI) application. Here's a step-by-step explanation of each part:

Before getting started, if you would like to test the solution, try pulling these Docker images from our public Docker Hub repository.

1. Pull our built Docker image
``
docker pull 03sarath/docker_gui_app:latest
``
2. Run the container using 
```
docker run -it --rm --net=host -e DISPLAY=host.docker.internal:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix docker_gui_app
```

#### To build your own Docker images, follow the steps below.

This Dockerfile is set up to create a Docker container that runs a simple graphical user interface (GUI) application. Here's a step-by-step explanation of each part:

```
# Use an Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies for the GUI application
RUN apt-get update && apt-get install -y x11-apps

# Set the display environment variable to point to the X11 server on the host
ENV DISPLAY=host.docker.internal:0

# Run the GUI application (xeyes in this case) when the container starts
CMD ["xeyes"]
```

1. Base Image: ``FROM ubuntu:latest`` This line specifies the base image for the Docker container. It uses the latest version of Ubuntu as the starting point.

2. Install Dependencies: ``RUN apt-get update && apt-get install -y x11-apps`` 

`apt-get update`: Updates the package list to ensure that you can get the latest versions of packages and their dependencies.

`apt-get install -y x11-apps`: Installs the `x11-apps` package, which includes simple X11 applications like `xeyes`, `xclock`, etc. The `-y` flag automatically confirms any prompts during installation.

