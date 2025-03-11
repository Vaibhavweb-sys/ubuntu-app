# Use ubuntu:latest as base image
FROM ubuntu:latest

# Update the repository sources list and install necessary packages
RUN apt-get update && \
    apt-get install -y curl net-tools telnet vim dnsutils netcat-openbsd nmap inetutils-ping libcap2-bin wget unixodbc-dev gnupg traceroute && \
    # Clean up
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Grant the necessary capabilities to the ping command
RUN setcap cap_net_raw+ep /bin/ping

# Create a new user 'appuser' and set it as the current user
RUN useradd -ms /bin/bash appuser
USER appuser
