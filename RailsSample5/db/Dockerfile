FROM mysql:5.7

# ENV MYSQL_DATABASE sampledb
ENV MYSQL_ROOT_PASSWORD password
ENV MYSQL_USER mysql_user
ENV MYSQL_PASSWORD mysql_user
ENV TZ 'Asia/Tokyo'

# MySQL設定ファイルをイメージ内にコピー
ADD ./my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]