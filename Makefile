VERSION ?= 0.0.6
IMAGE_NAME ?= splunk-kubernetes-objects:${VERSION}
TARGET_NAME ?= gimil/k8s-o:${VERSION}

docker: Dockerfile
	docker build -t $(IMAGE_NAME) .
	docker tag $(IMAGE_NAME) $(TARGET_NAME)

push:
	docker push $(TARGET_NAME)
