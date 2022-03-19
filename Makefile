default: docker_build

DOCKER_IMAGE ?= dvdhinesh/helm-base
DOCKER_TAG ?= `git rev-parse --abbrev-ref HEAD`

KUBE_VERSION = "1.23.5"

HELM_VERSION = "3.8.1"

docker_build:
	@docker buildx build \
	  --build-arg KUBE_VERSION=$(KUBE_VERSION) \
	  --build-arg HELM_VERSION=$(HELM_VERSION) \
	  -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
