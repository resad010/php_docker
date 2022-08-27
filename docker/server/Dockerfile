FROM ubuntu/nginx
WORKDIR /var/www
COPY sites /etc/nginx/sites-available
#RUN rm /etc/nginx/sites-available/default
RUN apt-get update && apt-get upgrade -y
RUN mkdir -p "/home/ubuntu/actions-runner/_work/php_docker/php_docker/files_be/public;"
