FROM nimmis/apache
WORKDIR /var/www/
RUN rm -rf /var/www/*
ADD HttpClient.py /var/www/
ADD HttpClient.pyc /var/www/
ADD QQBot.py /var/www/
EXPOSE 80
CMD wget http://www.skyju.cc/host/a/qbot/groupfollow.txt;wget http://www.skyju.cc/host/a/qbot/database.save;apachectl -k start;python2 QQBot.py
