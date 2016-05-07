FROM phusion/baseimage
MAINTAINER Jesse Mortenson <jessemortenson@gmail.com>

CMD ["/sbin/my_init"]

# INSTALL
# install python/scrapy OS prereqs
RUN apt-get update && apt-get install -y wget libffi-dev libxml2-dev libxslt1-dev zlib1g-dev libssl-dev

# install python2.7 and dev
RUN add-apt-repository ppa:fkrull/deadsnakes-python2.7
RUN apt-get update && apt-get install -y python2.7 python-dev

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py && python2.7 get-pip.py

# install Scrapy and other packages we use on tst
RUN pip install requests arrow service_identity Scrapy jsonpickle python-dotenv

# logging

# add project code?

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
