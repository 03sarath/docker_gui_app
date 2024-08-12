# Use an Ubuntu base image
FROM ubuntu:latest

# Install necessary dependencies for the GUI application
RUN apt-get update && apt-get install -y x11-apps

# Set the display environment variable to point to the X11 server on the host
ENV DISPLAY=host.docker.internal:0

# Run the GUI application (xeyes in this case) when the container starts
CMD ["xeyes"]