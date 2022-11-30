all: run

run:
	# Run miniPaint in docker container on port 8081 (see docker-compose.yaml)
	docker compose up
