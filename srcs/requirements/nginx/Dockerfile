FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

CMD ["nginx", "-g", "daemon off;"]
