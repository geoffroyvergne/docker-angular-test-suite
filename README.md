# Docker Angular test suite

Docker image to test (unit and e2e) angular appliaction

## Download Foirefox
https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=fr

## Build
````docker build -t angular-test-suite .````

## Run in container
````docker run --rm -it --entrypoint=bash angular-test-suite````

````docker run --rm -it --entrypoint="protractor /protractor.conf.js" angular-test-suite````

## Chrome Headless
````docker run --rm -it angular-test-suite chromium --headless --disable-gpu --dump-dom --no-sandbox https://google.com/````

## Run tests

### Run app first
````ng serve --host 0.0.0.0````

### Launch e2e tests
````docker run --rm -it angular-test-suite protractor protractor.conf.js --baseUrl=http://192.168.1.21:4200/````

### Launch unit tests
````docker run --rm -it angular-test-suite karma start karma.conf.js````

### Launch lint
````docker run --rm -it angular-test-suite ng lint````

### Use custom volumes

````
docker run --rm -it \
    -v $(pwd)/app/:/opt/app/ \
    angular-test-suite \
    protractor protractor.conf.js --baseUrl=http://192.168.1.21:4200/
````

````
docker run --rm -it \
    -v $(pwd)/app/protractor.conf.js:/opt/app/protractor.conf.js \
    angular-test-suite \
    protractor protractor.conf.js --baseUrl=http://192.168.1.21:4200/
````

````
docker run --rm -it \
    -v $(pwd)/app/:/opt/app/ \
    angular-test-suite \
    karma start karma.conf.js
````

````
docker run --rm -it \
    -v $(pwd)/app/karma.conf.js:/opt/app/karma.conf.js \
    angular-test-suite \
    karma start karma.conf.js    
````
