GRPC_SUBMODULE=https://github.com/Dilemma25/reminder-protoc.git

# сервисы grpc

AUTH_SRV_DIR = auth-service/
AUTH_SRV_LANG = python

USER_SRV_DIR = user-service/
USER_SRV_LANG = python

SERVICES = ${AUTH_SRV_DIR} ${USER_SRV_DIR}


create-grpc-contracts:
	@for srv in ${SERVICES}; do \
		git clone ${GRPC_SUBMODULE} $$srv/contracts \
	done


up-dev:
	@docker compose -f docker-compose-dev.yml up --build -d

down-dev:
	@docker compose -f docker-compose-dev.yml down