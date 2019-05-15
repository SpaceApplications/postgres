#!/usr/bin/env bash
# Configure pg_hba.conf

# NASA might require narrowed down list of allowed ips
allowed_ips="all"

# Echo multiline to file, overwrite existing pg_hba.conf
{
    echo "# Local access to db enabled if system user is postgres"
    echo "local all postgres peer"
    echo
    echo "# External access to db requires password and is only enabled for $DB_USER"
    echo "host msod $DB_USER $allowed_ips md5"
} > "$PGDATA/pg_hba.conf"
