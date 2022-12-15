build:
	podman build --platform=linux/amd64,linux/arm64/v8 . --tag sa-saopaulo-1.ocir.io/grywhcimox5r/wagnerpythonapp

docker_login:
	docker login sa-saopaulo-1.ocir.io
	# username must be passed as grywhcimox5r/wagneralbjr@gmail.com
	

build_arm:
	docker build --platform linux/arm64 -t sa-saopaulo-1.ocir.io/grywhcimox5r/wagnerpythonapp:arm64 .

