FROM python:3.9-slim-buster

ARG PROJECT_NAME=coursera_api
ARG GROUP_ID=5000
ARG USER_ID=5000


ENV VIRTUAL_ENV=/srv/${PROJECT_NAME}/.venv \
    PATH="$VIRTUAL_ENV/bin:$PATH" \
    \
    # эта переменная среды обеспечивает правильность работы импортов
    PYTHONPATH=/srv/${PROJECT_NAME} \
    # Keeps Python from generating .pyc files in the container
    PYTHONDONTWRITEBYTECODE=1 \
    # Turns off buffering for easier container logging
    PYTHONUNBUFFERED=1

RUN groupadd --gid ${GROUP_ID} ${PROJECT_NAME} && \
    useradd --home-dir /home/${PROJECT_NAME} --create-home --uid ${USER_ID} \
        --gid ${GROUP_ID} --shell /bin/sh --skel /dev/null ${PROJECT_NAME} && \
    mkdir /srv/${PROJECT_NAME} && \
    chown -R ${PROJECT_NAME}:${PROJECT_NAME} /srv/${PROJECT_NAME}

WORKDIR /srv/${PROJECT_NAME}



RUN \
    apt-get update && apt install -y git && \
    apt-get install gcc python3-dev wget -y && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh

RUN \
    bash Miniconda3-latest-Linux-aarch64.sh | yes && \
    export PATH=/home/debian/anaconda3/bin:$PATH && \
    python3 -m venv --system-site-packages $VIRTUAL_ENV 

COPY requirements.txt /srv/${PROJECT_NAME}


RUN \ 
    python3 -m pip install --no-cache -r requirements.txt

RUN \
    conda install -c conda-forge mamba && \
    mamba install -y bs4==4.10.0 html5lib==1.1

USER ${REMOTE_USER}