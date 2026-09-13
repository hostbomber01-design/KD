# Python base image use kar rahe hain
FROM python:3.10-slim

# Node.js aur zaroori system dependencies install kar rahe hain
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    procps \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Working directory set kar rahe hain
WORKDIR /app

# Application files copy kar rahe hain
COPY . /app

# Core Python dependencies install kar rahe hain
RUN pip install --no-cache-dir \
    pytelegrambotapi \
    psutil \
    flask \
    requests \
    Pillow \
    opencv-python-headless \
    scikit-learn \
    beautifulsoup4 \
    python-dotenv \
    pyyaml \
    aiohttp \
    numpy \
    pandas

# Environment variables set kar rahe hain
ENV PORT=8080
EXPOSE 8080

# Bot start karne ke liye command
CMD ["python", "main.py"]
