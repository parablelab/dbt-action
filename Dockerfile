FROM python:3.9-slim-buster
ARG DBT_VERSION="1.*"

RUN apt-get update && apt-get clean

# Update pip
RUN python -m pip install --upgrade pip setuptools wheel --no-cache-dir

# Install dbt libraries. 
RUN pip install --no-cache-dir \
    dbt-core==${DBT_VERSION} \
    dbt-snowflake==${DBT_VERSION}

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]