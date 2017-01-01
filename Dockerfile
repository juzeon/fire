FROM nimmis/apache
WORKDIR /var/www/html/
RUN rm -rf /var/www/html/*
ADD ./* /var/www/html/
RUN rm -rf /var/www/html/groupfollow.txt
EXPOSE 80
CMD wget http://www.skyju.cc/host/a/qbot/groupfollow.txt;wget http://www.skyju.cc/host/a/qbot/database.save;apachectl -k start;python2 QQBot.py
