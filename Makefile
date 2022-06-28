IMAGE=therumbler/tidal-dl-web:0.0.1a
# IMAGE=therumbler/tidal-dl-web.slim
build-docker:
	docker build -t ${IMAGE} .

run-docker:
	docker run  \
		--rm \
		--name tidal-dl-web \
		-p 3000:3000 \
		-v ${PWD}/settings/.tidal-dl.token.json:/root/.tidal-dl.token.json \
		-v ${PWD}/settings/.tidal-dl.json:/root/.tidal-dl.json \
		-v ${PWD}/download:/usr/nuxt-app/download \
	${IMAGE}

run-dev:
	yarn dev -o
