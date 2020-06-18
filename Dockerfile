FROM python:3.7-alpine
LABEL key="Julian"

ENV PYTHONUNBUFFERED 1

# Copies from local to docker image
COPY ./requirements.txt /requirements.txt
# Installs depedencies on docker image
RUN pip install -r /requirements.txt

# Creates empty folder on docker image
RUN mkdir /app
# Sets app directory on docker image as the default location to run app from
WORKDIR /app
# Copies content from local app folder to docker image
COPY ./app /app

# creates a user for running application
RUN adduser -D user
# Switch docker to the user
# This is for security reasons, so somebody can't gain root access
USER user