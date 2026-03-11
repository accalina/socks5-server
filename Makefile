
# do standard compilation
compile: main.go
	[ -f socks5-server ] && rm socks5-server || true
	go build -ldflags "-s -w" -o ./socks5-server main.go
	upx -9 --lzma socks5-server
	chmod +x socks5-server

# do optimize compilation
compile-prod: main.go
	[ -f socks5-server ] && rm socks5-server || true
	go build -a -gcflags=all="-l -B" -ldflags "-s -w" -o ./socks5-server main.go
	upx -9 --lzma socks5-server
	chmod +x socks5-server

# build docker image
dbuild: docker-compose.yml
	@COMPOSE_BAKE=true docker-compose build

# scan docker image
dscan: docker-compose.yml
	trivy image $(shell docker image ls --format "{{.Repository}}:{{.Tag}}" | head -n 1)

# scan docker image
dpush: docker-compose.yml
	docker-compose push

# build image, scan image, push image
deploy: docker-compose.yml
	docker-compose build --no-cache
	trivy image $(shell docker image ls --format "{{.Repository}}:{{.Tag}}" | head -n 1) | grep "Total: 0" && docker-compose push

# build image (with cache), scan image, push image
fast-deploy: docker-compose.yml
	docker-compose build
	trivy image $(shell docker image ls --format "{{.Repository}}:{{.Tag}}" | head -n 1) | grep "Total: 0" && docker-compose push
