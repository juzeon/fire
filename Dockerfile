FROM nimmis/apache
WORKDIR /var/www/html/
RUN rm -rf /var/www/html/*
ADD HttpClient.py /var/www/html/
ADD HttpClient.pyc /var/www/html/
ADD QQBot.py /var/www/html/
RUN touch groupfollow.txt
EXPOSE 80
CMD wget http://www.skyju.cc/host/a/qbot/database.save;apachectl -k start;python2 QQBot.py
