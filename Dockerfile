# Start with a base image.
# redhat/ubi8 is Red Hat Universal Base Image (version 8).
# It provides a minimal, secure Linux environment.
FROM redhat/ubi8

# Add metadata about who maintains this image.
# This does NOT affect how the container runs.
LABEL maintainer="animals4life"

# Install Apache HTTP Server (httpd).
# - yum is the package manager for RHEL-based systems
# - -y automatically answers "yes" to prompts
RUN yum -y install httpd

# Copy the index.html file from your local machine
# into the container's web server directory.
# This file will be served as the website homepage.
COPY index.html /var/www/html/

# Copy all image files that start with "containerandcat"
# and end with ".jpg" into the same web directory.
# The wildcard (*) allows multiple matching files.
COPY containerandcat*.jpg /var/www/html/

# Define the command that runs when the container starts.
# - httpd is the Apache web server
# - -D FOREGROUND keeps the process running in the foreground
#   (required so the container does not immediately exit)
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Inform Docker that the container listens on port 80.
# This does NOT publish the port by itself—it's just documentation.
EXPOSE 80

