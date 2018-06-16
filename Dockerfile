FROM node:10-stretch

RUN apt-get update && \
    apt-get install -y curl && \
    apt-get install -y --no-install-recommends chromium && \
    apt-get install -y openjdk-8-jre-headless

# Firefox
RUN apt-get install -y libgtk-3-0 libdbus-glib-1-2 libxt6

COPY firefox /opt/firefox
RUN chmod +x /opt/firefox/firefox
RUN chmod 777 /opt/firefox/firefox
RUN ln -s /opt/firefox/firefox /usr/local/bin/firefox

RUN mkdir -p /opt/app
WORKDIR /opt/app

RUN npm install -g protractor
RUN npm install -g karma
RUN npm install -g @angular/cli

ENV CHROME_BIN=/usr/bin/chromium

COPY app /opt/app
RUN npm install

RUN webdriver-manager update
RUN /opt/app/node_modules/protractor/bin/webdriver-manager update

#CMD ["protractor", "protractor.conf.js"]
