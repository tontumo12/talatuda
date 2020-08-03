FROM mysql:5.7
RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

ENV MYSQL_DATABASE=talatuda
ENV MYSQL_USER=tunt
ENV MYSQL_PASSWORD=120597
ENV MYSQL_ROOT_PASSWORD=tunt120597

ADD hotel_manager.sql ./hotel_manager.sql
RUN sed -i 's/MYSQL_DATABASE/'talatuda'/g' ./hotel_manager.sql
RUN cp ./hotel_manager.sql /docker-entrypoint-initdb.d

EXPOSE 3306