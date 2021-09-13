OWNER := marcopaspuel
PROJECT := datascience-notebook-seldon
VERSION := 0.0.1
OPV := $(OWNER)/$(PROJECT):$(VERSION)

all: docker-build docker-run

## Build Docker Image
.PHONY: docker-build
docker-build:
	docker build -f docker/Dockerfile -t $(OPV) .

## Run Notebook Container
.PHONY: docker-run
docker-run:
	docker run --rm -d --name $(PROJECT) -p 8888:8888 -v "${PWD}":/home/jovyan/work $(OPV)
	sleep 5
	docker logs $(PROJECT)

## Stop Notebook Container
.PHONY: docker-stop
docker-stop:
	docker stop $(PROJECT)
