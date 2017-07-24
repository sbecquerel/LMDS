FROM 925059019146.dkr.ecr.us-east-1.amazonaws.com/voozanoo4:release-2.24

COPY . /var/www/app/

RUN cp /var/www/app/resources/sql/etapes/install.sql /install.sql && \
    rm /var/www/app/configs/application.ini

ADD ./docker/build/application.ini /


