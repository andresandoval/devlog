# Use Debian as a parent image
FROM debian:latest

COPY start-jekyll.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Update the package index and install necessary packages
RUN apt-get update && apt-get install -y \
    ruby \
    ruby-bundler \
    ruby-dev \
    nano \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Display Ruby version and bundler version
RUN ruby --version && bundle --version && gem install bundler jekyll

# Command to run when the container starts
# CMD ["irb"]
ENTRYPOINT ["/entrypoint.sh"]