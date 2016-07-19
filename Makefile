.PHONY: image all clean


REPO=2infinity/openntpd
TAG=$(REPO):latest


image:
	docker build -t $(TAG) .

all: image

clean: 
	docker rmi $(TAG)
