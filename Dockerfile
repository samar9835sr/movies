FROM python:3.10-slim

WORKDIR /app

COPY . /app/

# Install build tools and dependencies for Pillow, tgcrypto, etc.
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    libffi-dev \
    libssl-dev \
    python3-dev \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    build-essential

# Upgrade pip
RUN pip install --upgrade pip

# Install Python packages
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["python", "bot.py"]
