FROM python:3.13-slim

ARG USER_NAME=llm
ARG USER_UID=1000
ARG USER_GID=1000

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV LLM_USER_PATH="/home/${USER_NAME}/.config/io.datasette.llm"

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g $USER_GID $USER_NAME \
    && useradd -m -s /bin/bash -u $USER_UID -g $USER_GID $USER_NAME

RUN mkdir -p $LLM_USER_PATH \
    && chown -R $USER_UID:$USER_GID $LLM_USER_PATH

USER $USER_UID:$USER_GID
ENV PATH="/home/${USER_NAME}/.local/bin:${PATH}"

RUN pip install -U pip \
    && pip install llm \
    && llm install llm-gemini \
    && llm install llm-jq

ENTRYPOINT ["llm"]
CMD ["--help"]
