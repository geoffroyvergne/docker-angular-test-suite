# Docker Angular E2E

Run Protractor Selenium for an Angular application in Docker.

## Download Foirefox
https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=fr

## Build
````docker build -t protractor .````

## Run in container
````docker run --rm -it --entrypoint=bash protractor````

````docker run --rm -it --entrypoint="protractor /protractor.conf.js" protractor````

## Chrome Headless
````chromium --headless --disable-gpu --dump-dom --no-sandbox https://google.com/````

## Run tests
````docker run --rm -it protractor````

````docker run --rm -it protractor protractor protractor.conf.js --baseUrl=http://www.google.fr````
