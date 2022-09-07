FROM python:3.10-slim-buster

# Temporary for local testing
#
# Do comment this out when pushing. it will crash the deployment
#
#ARG aws_access_key_id
#ENV AWS_ACCESS_KEY_ID $aws_access_key_id
#ARG aws_secret_access_key
#ENV AWS_SECRET_ACCESS_KEY $aws_secret_access_key
ENV PRODIGY_LOGGING=verbose

RUN pip install --upgrade pip

# install base packages
RUN apt-get clean \
    && apt-get update --fix-missing \
    && apt-get install -y \
    git \
    curl \
    gcc \
    g++ \
    build-essential \
    wget \
    awscli \
    libpq-dev

WORKDIR /work

# copy over shell files and make them executable
COPY . .
RUN chmod +x *

# install python dependencies
RUN pip install -r requirements.in

# add the code as the final step so that when we modify the code
# we don't bust the cached layers holding the dependencies and
# system packages.

RUN chmod +rwx *
CMD [ "/bin/bash" ]
