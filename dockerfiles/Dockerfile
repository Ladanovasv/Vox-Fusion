FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=Etc/UTC
ARG DEBIAN_FRONTEND=noninteractive
ARG APT_DPDS=apt_packages.txt
ARG PY_DPDS=requirements.txt

WORKDIR /tmp

USER root

# install apt dependencies
RUN apt update
COPY ./${APT_PKGS} ./
RUN xargs apt install \
    --yes \
    --no-install-recommends < ${APT_DPDS}

# install python dependencies
COPY ./${PY_DPDS} ./
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install \
        --no-cache-dir \
        --requirement ${PY_DPDS} \
        --extra-index-url https://download.pytorch.org/whl/cu117

# Clean up
RUN apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]