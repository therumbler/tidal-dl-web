IMAGE=therumbler/tidal-dl-web:0.0.1a

build-docker:
	docker build -t ${IMAGE} .

run-docker:
	docker run  \
		-p 3000:3000 \
	${IMAGE}