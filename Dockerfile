FROM python:3.9-slim

# Install system dependencies needed for Flask-MySQLdb
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install
COPY requirement.txt .
RUN pip install --no-cache-dir -r requirement.txt

# Copy the rest of the app
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
