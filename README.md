Build
============

docker build -t tst/scrapy-dev .


Run
============

Run as an interactive shell/environment that includes files from your present working directory:

`docker run -it --rm -v $(pwd):/code -w /code -e "SUBMIT_SHOWBILLS=0" -e "PYTHONDONTWRITEBYTECODE=1" tst/scrapy-dev bash`

* `-it` gives you an interactive terminal in the commandline
* `--rm` stops/removes the docker container after you exit it 
* `-w` sets working directory for container
* `-v` creates a volume for the container (sets /code in the container to whatever is in your present working dir)
* `-e "SUBMIT_SHOWBILLS=0"` sets an environment variable used by the Spiders repo. If set to 0 then no showbills will be submitted to Engine
* `-e "PYTHONDONTWRITEBYTECODE=1"` sets an environment variable used by Python. This prevents it from generating .pyc files (which can get in the way of development)
* `tst/scrapy-dev` is the label of the docker image we are running
* bash is the bash shell, used for executing commands :)

Useful Dev commands once you're in
===========

`scrapy parse http://first-avenue.com/event/2016/07/transmission-princetribute -c parse_show --pipelines`

This runs a particular URL through scrapy (it attempts to auto-detect which spider to run). In this case the `-c` argument is used to tell it specifically which function to use on the spider (since this is a multiple-level spider and we are feeding it a lower level URL). `--pipelines` is used to tell it to run the resulting items through the pipelines, so we can see logged JSON content etc.. or optionally send it as a test case to Engine depending on environment variable SUBMIT_SHOWBILLS as described above.

`scrapy crawl firstave`

This runs the specified spider (here, firstave, as defined in firstave.py in the Spiders repo) including pipelines.

`scrapy runspider stackoverflow_spider.py -o top-stackoverflow-questions.json`

This is just a simple example spider included with this container, to verify that scrapy itself is working.

