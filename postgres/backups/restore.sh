#!/bin/sh
wait 30
su - postgres
pg_restore -U postgres -d vue-db dump.tar