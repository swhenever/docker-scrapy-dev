Build
============

docker build -t tst/scrapy-dev .


Run
============

Run as an interactive shell/environment that includes files from your present working directory:

docker run -it --rm -v `pwd`:/code -w /code tst/scrapy-dev bash

--rm stops/removes the docker container after you exit it 
-w sets working directory for container
-v creates a volume for the container (sets /code in the container to whatever is in your present working dir)
bash is bash


Test spiders
============

Inside, run scrapy:

scrapy runspider stackoverflow_spider.py -o top-stackoverflow-questions.json