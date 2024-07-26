# A Dockerfile that sets up a full Gymnasium install with test dependencies
ARG PYTHON_VERSION
ARG NUMPY_VERSION=">=1.21,<2.0"
FROM python:$PYTHON_VERSION

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get -y update \
    && apt-get install --no-install-recommends -y \
    libglu1-mesa-dev libgl1-mesa-dev libosmesa6-dev \
    xvfb unzip patchelf ffmpeg cmake swig \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    # Download mujoco
    && mkdir /root/.mujoco \
    && cd /root/.mujoco \
    && wget -qO- 'https://github.com/deepmind/mujoco/releases/download/2.1.0/mujoco210-linux-x86_64.tar.gz' | tar -xzvf -

ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/root/.mujoco/mujoco210/bin"

COPY . /usr/local/gymnasium/
WORKDIR /usr/local/gymnasium/

# Specify the numpy version to cover both 1.x and 2.x
RUN pip install --upgrade "numpy$NUMPY_VERSION"

# Test with PyTorch CPU build, since CUDA is not available in CI anyway
RUN pip install .[all,testing] --no-cache-dir --extra-index-url https://download.pytorch.org/whl/cpu

ENTRYPOINT ["/usr/local/gymnasium/bin/docker_entrypoint"]
