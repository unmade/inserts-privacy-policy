FROM python:3.8-alpine

COPY ./requirements.txt /

RUN apk add --no-cache --virtual .build-deps gcc libc-dev \
    && pip install -r requirements.txt \
    && apk del .build-deps gcc libc-dev

ENV HOME_DIR /usr/src/app
ENV PYTHONPATH=${HOME_DIR}

COPY ./start.sh ${HOME_DIR}/start.sh
RUN chmod +x ${HOME_DIR}/start.sh

COPY ./main.py ${HOME_DIR}
WORKDIR ${HOME_DIR}

EXPOSE 80

CMD ["./start.sh"]

