#!/bin/bash

NAME="gateway"

#path to your django application

DIR=/home/megaspeed/django-apps/gateway

USER=megaspeed 

GROUP=megaspeed 

WORKERS=3

BIND=0.0.0.0:8000

#bind to port 8000

DJANGO_SETTINGS_MODULE=gateway.settings

DJANGO_WSGI_MODULE=gateway.wsgi

LOG_LEVEL=error

cd $DIR

source /home/megaspeed/django-apps/env/bin/activate

#activating the virtual environment

export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE

export PYTHONPATH=$DIR:$PYTHONPATH

exec /home/megaspeed/django-apps/env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \

  --name $NAME \

  --workers $WORKERS \

  --user=$USER \

  --group=$GROUP \

  --bind=$BIND \

  --log-level=$LOG_LEVEL \

  --log-file=-
