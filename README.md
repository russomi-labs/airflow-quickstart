# Quickstart

## Airflow Quickstart and Tutorial
* [Quickstart](https://airflow.apache.org/start.html)
* [Tutorial](https://airflow.apache.org/tutorial.html)

## ETL best practices with Airflow

[ETL best practices with Airflow](https://gtoonstra.github.io/etl-with-airflow/index.html) is an excellent guide on best
practices for Airflow.

- [etl-example](https://gtoonstra.github.io/etl-with-airflow/etlexample.html#etl-example)
- ...

### Option 1: Install Airflow on Host System

```bash
export SLUGIFY_USES_TEXT_UNIDECODE=yes
pip2 install -r requirements-dev.txt
```

### Option 2: Run Airflow with Docker

See the [Run Airflow from Docker](https://gtoonstra.github.io/etl-with-airflow/etlexample.html#run-airflow-from-docker) 
tutorial for additional details. 

#### Prerequisites

- Install [Docker](https://www.docker.com/)
- Install [Docker Compose](https://docs.docker.com/compose/install/)
- Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/apache-airflow)

#### Usage

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

#### Other commands

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

Other `docker-compose` examples:

```bash

docker-compose -f docker-compose-LocalExecutor.yml up --abort-on-container-exit
docker-compose -f docker-compose-LocalExecutor.yml down
docker-compose -f docker-compose-LocalExecutor.yml up -d

# list dags by running the webserver container and using the airflow cli
docker-compose run --rm webserver airflow list_dags

# unpause init_docker_example


```


#### docker-compose usage

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



#### Connect to database

If you want to use Ad hoc query, make sure you've configured connections:
Go to Admin -> Connections and Edit "postgres_default" set this values:
- Host : postgres
- Schema : airflow
- Login : airflow
- Password : airflow


## Credits

- [Apache Airflow](https://github.com/apache/incubator-airflow)
- [docker-airflow](https://github.com/puckel/docker-airflow)


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

Airflow tutorial (Original)
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


---

# airflow-beam-quickstart 

## [Apache Beam Python SDK Quickstart](https://beam.apache.org/get-started/quickstart-py/)

> This guide shows you how to set up your Python development environment, get the Apache Beam SDK for Python, and run an example pipeline.

## Set up your environment

### Check your Python version

The Beam SDK for Python requires Python version 2.7.x. Check that you have version 2.7.x by running:

```
python --version
```

### Install pip

Install [pip](https://pip.pypa.io/en/stable/installing/), Python's package manager. Check that you have version 7.0.0 or newer by running:

```
pip --version
```

If you do not have `pip` version 7.0.0 or newer, run the following command to
install it. This command might require administrative privileges.


```
pip install --upgrade pip
```


### Install Python virtual environment

It is recommended that you install a [Python virtual environment](http://docs.python-guide.org/en/latest/dev/virtualenvs/)
for initial experiments. If you do not have `virtualenv` version 13.1.0 or
newer, run the following command to install it. This command might require
administrative privileges.

```
pip install --upgrade virtualenv
```

If you do not want to use a Python virtual environment (not recommended), ensure
`setuptools` is installed on your machine. If you do not have `setuptools`
version 17.1 or newer, run the following command to install it.

```
pip install --upgrade setuptools
```

## Get Apache Beam

### Create and activate a virtual environment

A virtual environment is a directory tree containing its own Python distribution. To create a virtual environment, 
create a directory and run:

```
virtualenv /path/to/directory
```

A virtual environment needs to be activated for each shell that is to use it.
Activating it sets some environment variables that point to the virtual
environment's directories.

To activate a virtual environment in Bash, run:

```
. /path/to/directory/bin/activate
```

That is, execute the `activate` script under the virtual environment directory you created.

For instructions using other shells, see the [virtualenv documentation](https://virtualenv.pypa.io/en/stable/userguide/#activate-script).

### Download and install

Install the latest Python SDK from PyPI:

```
pip install apache-beam
```

#### Extra requirements

The above installation will not install all the extra dependencies for using features like the Google Cloud Dataflow runner. 
Information on what extra packages are required for different features are highlighted below. 
It is possible to install multiple extra requirements using something like `pip install apache-beam[feature1,feature2]`.

- **Google Cloud Platform**
  - Installation Command: `pip install apache-beam[gcp]`
  - Required for:
    - Google Cloud Dataflow Runner
    - GCS IO
    - Datastore IO
    - BigQuery IO
- **Tests**
  - Installation Command: `pip install apache-beam[test]`
  - Required for developing on beam and running unittests
- **Docs**
  - Installation Command: `pip install apache-beam[docs]`
  - Generating API documentation using Sphinx

## Execute a pipeline

The Apache Beam [examples](https://github.com/apache/beam/tree/master/sdks/python/apache_beam/examples) directory has many examples. 
All examples can be run locally by passing the required arguments described in the example script.

For example, run `wordcount.py` with the following command:

**Direct Runner**

```
python -m apache_beam.examples.wordcount --input /path/to/inputfile --output /path/to/write/counts
```

**Dataflow Runner**

```
# As part of the initial setup, install Google Cloud Platform specific extra components. Make sure you
# complete the setup steps at {{ site.baseurl }}/documentation/runners/dataflow/#setup
pip install apache-beam[gcp]
python -m apache_beam.examples.wordcount --input gs://dataflow-samples/shakespeare/kinglear.txt \
                                         --output gs://<your-gcs-bucket>/counts \
                                         --runner DataflowRunner \
                                         --project your-gcp-project \
                                         --temp_location gs://<your-gcs-bucket>/tmp/
```

After the pipeline completes, you can view the output files at your specified
output path. For example, if you specify `/dir1/counts` for the `--output`
parameter, the pipeline writes the files to `/dir1/` and names the files
sequentially in the format `counts-0000-of-0001`.

## Next Steps

* Learn more about the [Beam SDK for Python](https://beam.apache.org/documentation/sdks/python/)
  and look through the [Python SDK API reference](https://beam.apache.org/releases/pydoc).
* Walk through these WordCount examples in the [WordCount Example Walkthrough](https://beam.apache.org/get-started/wordcount-example/).
* Take a self-paced tour through our [Learning Resources](https://beam.apache.org/documentation/resources/learning-resources/).
* Dive in to some of our favorite [Videos and Podcasts](https://beam.apache.org/documentation/resources/videos-and-podcasts/).
* Join the Beam [users@](https://beam.apache.org/community/contact-us) mailing list.

# References  
- https://beam.apache.org/get-started/quickstart-py/
- https://medium.com/google-cloud/setting-up-a-java-development-environment-for-apache-beam-on-google-cloud-platform-ec0c6c9fbb39
 
