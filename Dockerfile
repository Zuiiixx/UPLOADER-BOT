FROM python:3.10-slim

# Install build dependencies required for tgcrypto
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libffi-dev \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy only the requirements first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Start command (change as per your app)
CMD ["python3", "bot.py"
