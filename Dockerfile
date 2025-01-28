# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy website code to Apache's default location
COPY . /var/www/html/

# Expose port 82 for the website
EXPOSE 82

# Start Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]