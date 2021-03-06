IMAGE_NAME = dbrletic/sbt-base:1.4.1

.PHONY: build
build:
	docker build --no-cache=True --build-arg SCALA_VERSION --build-arg SBT_VERSION --build-arg http_proxy --build-arg https_proxy -t  $(IMAGE_NAME) .

.PHONY: test
test:
	docker build --build-arg SCALA_VERSION --build-arg SBT_VERSION --build-arg http_proxy --build-arg https_proxy -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate test/run