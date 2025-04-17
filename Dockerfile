FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Basic setup
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set Python 3.10 as default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1

# Copy project files
WORKDIR /app
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Optional: install extra stuff for Jupyter support or training tools
# RUN pip install jupyter matplotlib

CMD [ "python", "train.py" ]
