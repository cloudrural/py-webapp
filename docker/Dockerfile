FROM python:alpine

ENV APP_HOME=/opt/app 

COPY ../. ${APP_HOME}

WORKDIR ${APP_HOME}

EXPOSE 5000

CMD ["python","main.py"]
