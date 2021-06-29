#!/bin/bash
redis_password=
postgresql_user=mayan
postgresql_password=
postgresql_db=mayan
kubectl create secret generic mayan -n mayan \
--from-literal=redis-password=${redis_password} \
--from-literal=postgresql-password=${postgresql_password} \
--from-literal=postgresql-postgres-password=${postgresql_password} \
--from-literal=postgresql-replication-password=${postgresql_password} \
--from-literal=postgresql-ldap-password=${postgresql_password} \
--from-literal=celery_broker_url="redis://:${redis_password}@mayan-redis-master:6379/0" \
--from-literal=celery_result_backend="redis://:${redis_password}@mayan-redis-master:6379/1" \
--from-literal=databases="{'default':{'ENGINE':'django.db.backends.postgresql','NAME':'${postgresql_db}','PASSWORD':'${postgresql_password}','USER':'${postgresql_user}','HOST':'mayan-postgresql'}}" \
--from-literal=lock_manager_backend_arguments="{'redis_url':'redis://:${redis_password}@mayan-redis-master:6379/2'}"
