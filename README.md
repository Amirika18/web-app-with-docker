To start the builder: 
1. Add .env file in main directory containing:
```
NODE_ENV=development
SERVER_PORT=3000
SERVER_HOST=app
#
PGHOST=db
PGUSER=postgres
PGDATABASE=vue-db
PGPASSWORD={your password here}
PGPORT=5432
#
SESSION_SECRET=very_hard-session!secret.12652364
```
2. Run the command
```
docker compose up --build
```
