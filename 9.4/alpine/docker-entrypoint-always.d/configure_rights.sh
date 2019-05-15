#!/usr/bin/env bash

# TODO: Setup msodreporter settings here

# Create a non-superuser user without rights to 1) create databases 2) create users
#/usr/bin/createuser "$DB_USER" -D -R

echo "Creating user $DB_USER if it doesn't exists"
psql -tc "SELECT 1 FROM pg_user WHERE usename = '$DB_USER'"  \
    | grep -q 1 && echo "User ${DB_USER} already exists"  \
    || psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';"

psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO $DB_USER;"
psql -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO $DB_USER;"
psql -c "GRANT ALL PRIVILEGES ON SCHEMA public TO $DB_USER;"

# TODO: Do the below?
#REVOKE CREATE ON SCHEMA public FROM public;

