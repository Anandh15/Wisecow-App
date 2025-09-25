# Use a base image
FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    netcat-openbsd \
 && rm -rf /var/lib/apt/lists/*

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Set the working directory
WORKDIR /app

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the server port
EXPOSE 4499

# Set PATH environment variable (cowsay and fortune live here)
ENV PATH="/usr/games:${PATH}"

# Set the startup command
CMD ["./wisecow.sh"]
