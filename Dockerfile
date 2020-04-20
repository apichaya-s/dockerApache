# .Description
#   Create apache docker image 
# .Example
#   docker build . -t image_name


# base image of this image
FROM ubuntu

# run these commands inside the image
RUN apt-get update
RUN apt-get -y install apache2
RUN echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

# add file from current directory to the image
ADD . /var/www/html

# run this command when startup a container
# Ex. apachectl -D FORGROUND
ENTRYPOINT ["apachectl", "-D"]
# pass command arguments to the ENTRYPOINT if not specific
CMD ["FOREGROUND"]

# set name as environment variable: name = "test variable"
ENV name test variable