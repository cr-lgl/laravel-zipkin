FROM nginx:alpine

COPY ./nginx.conf /etc/nginx/

COPY ./sites/a.conf /etc/nginx/sites-available/
COPY ./sites/b.conf /etc/nginx/sites-available/

ADD ./startup.sh /opt/startup.sh

CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 443