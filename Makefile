GRPC_SUBMODULE=https://github.com/Dilemma25/reminder-protoc.git

# сервисы grpc

SERVICES = auth-service:python user-service:python


########--работа с саб модулями
submodules-init:
	@git submodule update --init --recursive

submodules-update:
	@git submodule update --remote


 ########--работа с grpc файлами
generate-grpc:
	@for srv in ${SERVICES}; do \
		dir=$$(echo $$srv | cut -d':' -f1)/; \
		lang=$$(echo $$srv | cut -d':' -f2); \
		echo "→ Dir: $$dir, Lang: $$lang"; \
		( \
			cd $$dir/contracts && \
			make $$lang \
		); \
	done


########--работа с контейнерами
up-dev:
	@docker compose -f docker-compose-dev.yml up --build -d

down-dev:
	@docker compose -f docker-compose-dev.yml down