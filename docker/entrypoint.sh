#!/usr/bin/env bash
airflow db init

# Create user admin
airflow users create -r Admin -u admin -e example@gmail.com -f first_name -l last_name -p password

# Run the scheduler in background
airflow scheduler &> /dev/null &

# Run the web server in foreground (for docker logs)
exec airflow webserver
