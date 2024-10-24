# Definisci il percorso del file docker-compose.yml
COMPOSE_FILE = ./srcs/docker-compose.yml

# Target di default: esegue "up"
all: up

# Avvia i container in background
up:
	@docker-compose -f $(COMPOSE_FILE) up -d

# Ferma e rimuove i container
down:
	@docker-compose -f $(COMPOSE_FILE) down

# Ferma i container senza rimuoverli
stop:
	@docker-compose -f $(COMPOSE_FILE) stop

# Riavvia i container fermati
start:
	@docker-compose -f $(COMPOSE_FILE) start

# Mostra lo stato dei container attivi
status:
	@docker ps
