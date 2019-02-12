# Quickstart

## Airflow Quickstart and Tutorial
* [Quickstart](https://airflow.apache.org/start.html)
* [Tutorial](https://airflow.apache.org/tutorial.html)

## ETL best practices with Airflow

[ETL best practices with Airflow](https://gtoonstra.github.io/etl-with-airflow/index.html) is an excellent guide on best
practices for Airflow.

[etl-example](https://gtoonstra.github.io/etl-with-airflow/etlexample.html#etl-example)

### Install Airflow on Host System

```bash
export SLUGIFY_USES_TEXT_UNIDECODE=yes
pip2 install -r requirements-dev.txt
```

### Run Airflow with Docker

See the [Run Airflow from Docker](https://gtoonstra.github.io/etl-with-airflow/etlexample.html#run-airflow-from-docker) 
tutorial for additional details. 

### Prerequisites

- Install [Docker](https://www.docker.com/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

### Usage

Run the web service with docker

```bash
# See https://docs.docker.com/compose/reference/envvars and
# https://docs.docker.com/compose/compose-file/#variable-substitution
export COMPOSE_FILE=docker-compose-LocalExecutor.yml

docker-compose up -d

# Build the image
# docker-compose up -d --build
```

Check http://localhost:8080/

- `docker-compose logs` - Displays log output
- `docker-compose ps` - List containers
- `docker-compose down` - Stop containers

## Other commands

If you want to run other airflow sub-commands, you can do so like this:

* `docker-compose run --rm webserver airflow list_dags` - List dags
* `docker-compose run --rm webserver airflow test [DAG_ID] [TASK_ID] [EXECUTION_DATE]` - Test specific task

```bash
# See https://docs.docker.com/compose/reference/envvars and
# https://docs.docker.com/compose/compose-file/#variable-substitution
export COMPOSE_FILE=docker-compose-LocalExecutor.yml

# List dags
docker-compose run \
    --no-deps \
    --rm \
    webserver airflow list_dags

# test specific task
docker-compose run \
    --no-deps \
    --rm webserver \
    airflow test \
    init_docker_example \
    initialize_etl_example \
    2019-01-12T00:00:00+00:00

```

## docker-compose usage

For example:

    $ docker-compose run web python manage.py shell

By default, linked services will be started, unless they are already
running. If you do not want to start linked services, use
`docker-compose run --no-deps SERVICE COMMAND [ARGS...]`.

```

Usage:
    run [options] [-v VOLUME...] [-p PORT...] [-e KEY=VAL...] [-l KEY=VALUE...]
        SERVICE [COMMAND] [ARGS...]

Options:
    -d, --detach          Detached mode: Run container in the background, print
                          new container name.
    --name NAME           Assign a name to the container
    --entrypoint CMD      Override the entrypoint of the image.
    -e KEY=VAL            Set an environment variable (can be used multiple times)
    -l, --label KEY=VAL   Add or override a label (can be used multiple times)
    -u, --user=""         Run as specified username or uid
    --no-deps             Don't start linked services.
    --rm                  Remove container after run. Ignored in detached mode.
    -p, --publish=[]      Publish a container's port(s) to the host
    --service-ports       Run command with the service's ports enabled and mapped
                          to the host.
    --use-aliases         Use the service's network aliases in the network(s) the
                          container connects to.
    -v, --volume=[]       Bind mount a volume (default [])
    -T                    Disable pseudo-tty allocation. By default `docker-compose run`
                          allocates a TTY.
    -w, --workdir=""      Working directory inside the container

```



## Connect to database

If you want to use Ad hoc query, make sure you've configured connections:
Go to Admin -> Connections and Edit "postgres_default" set this values:
- Host : postgres
- Schema : airflow
- Login : airflow
- Password : airflow


## Credits

- [Apache Airflow](https://github.com/apache/incubator-airflow)
- [docker-airflow](https://github.com/puckel/docker-airflow)

```bash

docker-compose -f docker-compose-LocalExecutor.yml up --abort-on-container-exit
docker-compose -f docker-compose-LocalExecutor.yml down
docker-compose -f docker-compose-LocalExecutor.yml up -d

# list dags by running the webserver container and using the airflow cli
docker-compose run --rm webserver airflow list_dags

# unpause init_docker_example


```

## Resources

* [ETL best practices with Airflow](https://gtoonstra.github.io/etl-with-airflow/index.html)
    * [Run Airflow with Docker](https://gtoonstra.github.io/etl-with-airflow/etlexample.html#run-airflow-from-docker)
* [gtoonstra/etl-with-airflow](https://github.com/gtoonstra/etl-with-airflow/)    
* [airflow-tutorial](https://github.com/tuanavu/airflow-tutorial)
* [docker-airflow](https://github.com/puckel/docker-airflow)

---

## Google Cloud Composer Quickstart

* [Google Cloud Composer Quickstart](https://cloud.google.com/composer/docs/quickstart)

### Using gcloud to set variables

The `gcloud composer` command can be used to set airflow variables.

```bash

export GCP_PROJECT=$(gcloud config get-value core/project)
export GCE_ZONE=$(gcloud config get-value compute/zone)

export ENVIRONMENT=dev
export ENVIRONMENT_NAME=$GCP_PROJECT'-'$ENVIRONMENT
export LOCATION=us-$GCE_ZONE
export GCS_BUCKET=$GCP_PROJECT'-'$ENVIRONMENT_NAME'-bucket'

gsutil mb $GCS_BUCKET

gcloud composer environments run $ENVIRONMENT_NAME \
 --location LOCATION variables -- \
 --set gcp_project $GCP_PROJECT
 
gcloud composer environments run $ENVIRONMENT_NAME \
 --location LOCATION variables -- \
 --set gcs_bucket $GCS_BUCKET

gcloud composer environments run $ENVIRONMENT_NAME \
 --location LOCATION variables -- \
 --set gce_zone $GCE_ZONE
```

---

Airflow tutorial
---

This is the code for [Airflow-tutorial](https://www.youtube.com/playlist?list=PLYizQ5FvN6pvIOcOd6dFZu3lQqc6zBGp2) playlist by Tuan Vu on Youtube
* [Airflow tutorial 1: Introduction to Apache Airflow](https://www.applydatascience.com/airflow/airflow-tutorial-introduction/)
* [Airflow tutorial 2: Set up airflow environment with docker](https://www.applydatascience.com/airflow/set-up-airflow-env-with-docker/)
* [Airflow tutorial 4: Writing your first pipeline](https://www.applydatascience.com/airflow/writing-your-first-pipeline/)


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

- Clone this repo
- Install the prerequisites
- Run the service
- Check http://localhost:8080
- Done! :tada:

### Prerequisites

- Install [Docker](https://www.docker.com/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

### Usage

Run the web service with docker

```
docker-compose up -d

# Build the image
# docker-compose up -d --build
```

Check http://localhost:8080/

- `docker-compose logs` - Displays log output
- `docker-compose ps` - List containers
- `docker-compose down` - Stop containers

## Other commands

If you want to run other airflow sub-commands, you can do so like this:

- `docker-compose run --rm webserver airflow list_dags` - List dags
- `docker-compose run --rm webserver airflow test [DAG_ID] [TASK_ID] [EXECUTION_DATE]` - Test specific task

## Connect to database

If you want to use Ad hoc query, make sure you've configured connections:
Go to Admin -> Connections and Edit "postgres_default" set this values:
- Host : postgres
- Schema : airflow
- Login : airflow
- Password : airflow


## Credits

- [Apache Airflow](https://github.com/apache/incubator-airflow)
- [docker-airflow](https://github.com/puckel/docker-airflow)