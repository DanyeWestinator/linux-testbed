# syntax=docker/dockerfile:1
FROM python:3.10-alpine

#FROM ubuntu:22.04

# install app dependencies
#RUN apt-get update && apt-get install -y python3 python3-pip
#RUN pip install flask==3.0.*

# install app
#COPY hello.py /

# final configuration
#ENV FLASK_APP=hello
#EXPOSE 8000
#CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
# syntax=docker/dockerfile:1

#FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run", "--debug"]
