# Docker GUI App 

This Docker example is set up to create a Docker container that runs a simple graphical user interface (GUI) application. Here's a step-by-step explanation of each part:

Before getting started, if you would like to test the solution, try pulling these Docker images from our public Docker Hub repository.

1. Pull our built Docker image
``
docker pull 03sarath/docker_gui_app:latest
``
2. Run the container using 
``docker run -it --rm --net=host -e DISPLAY=host.docker.internal:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix docker_gui_app``