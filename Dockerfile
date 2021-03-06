FROM python:3.8-alpine

COPY ./requirements.txt /

RUN apk add --no-cache --virtual .build-deps gcc libc-dev \
    && pip install -r requirements.txt \
    && apk del .build-deps gcc libc-dev

ENV HOME_DIR /usr/src/app
ENV PYTHONPATH=${HOME_DIR}

COPY ./main.py ${HOME_DIR}/main.py
COPY ./policy.py ${HOME_DIR}/policy.py
WORKDIR ${HOME_DIR}

EXPOSE 80

CMD uvicorn main:app --host 0.0.0.0 --port ${PORT}

