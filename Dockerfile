# Use a lightweight base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git curl sudo shellinabox && \
    apt-get clean

# Clone the hackingtool repository
RUN git clone https://github.com/z4nzu/hackingtool.git /opt/hackingtool

# Set working directory
WORKDIR /opt/hackingtool

# Run the installation for hackingtool
RUN bash install.sh

# Expose port for shellinabox
EXPOSE 4200

# Start shellinabox, then run hackingtool
CMD service shellinabox start && /opt/hackingtool/hackingtool
