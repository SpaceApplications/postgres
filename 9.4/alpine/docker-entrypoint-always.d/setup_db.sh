#!/usr/bin/env bash

if [ "${CREATE_EMPTY_DB}" == "1" ]; then
    echo "${PURPLE}Creating empty database${END}"
    # create DB if it doesn't already exist
    psql -tc "SELECT 1 FROM pg_database WHERE datname = '${DB_NAME}'"  \
  | grep -q 1 && echo "Database ${DB_NAME} already exists"  \
  || psql -c "CREATE DATABASE ${DB_NAME}"
fi