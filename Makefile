postgres:
	docker run --name moon-postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=moon -d postgres:12-alpine
createDB:
	docker exec -it moon-postgres createdb --username=root --owner=root simple_bank

migrate:
	migrate create -ext sql -dir db/migration -seq init_schema

dropDB:
	docker exec -it moon-postgres dropdb simple_bank
migrateUP:
	migrate -path db/migration -database "postgres://root:moon@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateDown:
	migrate -path db/migration -database "postgres://root:moon@localhost:5432/simple_bank?sslmode=disable" -verbose down
sqlc:
	sqlc generate

.PHONY: postgres createDB  migrate dropDB migrateUP migrateDown sqlc