FROM nginx:1.26.2-alpine

LABEL Name="class-noticepage Version=V20250701"
LABEL maintainer="Jiam Seo <jams7777@gmail.com>"

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ Asia/Seoul

COPY nginx.conf /etc/nginx/nginx.conf.template
RUN cp /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bak
COPY index.html /usr/share/nginx/html
RUN cp /docker-entrypoint.sh /docker-entrypoint.sh.bak
COPY docker-entrypoint_dev.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /usr/share/nginx/html

EXPOSE 8080

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/bin/sh"]
