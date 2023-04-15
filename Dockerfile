# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.7-slim

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1
# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
WORKDIR /content
COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y sudo \
    && apt-get install -y vim \
    && apt-get install -y gcc \
    && apt-get install -y g++ \
    && apt-get install -y cmake \
    && python -m pip install --upgrade pip \
    && python -m pip install jupyter \
    && python -m pip install -r requirements.txt

COPY . /content

EXPOSE 8888 8080

ENTRYPOINT ["/bin/sh"]
CMD ["./start.sh"]
