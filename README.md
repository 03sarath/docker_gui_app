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

2. Install Dependencies: `RUN apt-get update && apt-get install -y x11-apps`

`apt-get update`: Updates the package list to ensure that you can get the latest versions of packages and their dependencies.

`apt-get install -y x11-apps`: Installs the `x11-apps` package, which includes simple X11 applications like `xeyes`, `xclock`, etc. The `-y` flag automatically confirms any prompts during installation.

3. Set Display Environment Variable: `ENV DISPLAY=host.docker.internal:0`

`DISPLAY`: This environment variable tells the container where to render the graphical output. The value host.docker.internal:0 is used to direct the output to the host's X11 server display, which allows you to see the GUI application running on your local machine.

Note: This configuration assumes you're using a setup that allows GUI applications from the container to be displayed on the host machine. This often requires an X server running on the host and appropriate network permissions.

4. Run the GUI Application: `CMD ["xeyes"]`

`CMD`: Specifies the default command to run when the container starts. In this case, it runs xeyes, a simple GUI application that displays a pair of eyes that follow the cursor around the screen.

### Step:1 You have now built your Docker image using the Dockerfile in this repository.

```
docker build -t docker_gui_app:v1 .

```

### Step:2 `VcXsrv` Windows X Server setup

`VcXsrv` Windows X Server plays a crucial role in allowing GUI applications running inside a Docker container on a Windows host to be displayed on the host's screen. Here's how it fits into the setup:

##### Role of VcXsrv
VcXsrv is an X11 server for Windows that allows graphical applications running in Docker containers to be displayed on a Windows machine. It acts as a bridge by interpreting the X11 protocol, which is used for rendering graphical interfaces originally designed for UNIX systems. The Docker container sends its graphical output to VcXsrv by setting the `DISPLAY` environment variable to `host.docker.internal:0`, directing the application's display to the host's X11 server.


##### Setting Up VcXsrv with Docker on Windows

1. Download & Install VcXsrv Windows X Server from below link: https://sourceforge.net/projects/vcxsrv/


2. Setup VcXsrv, open the software


