# Use the official Python image from DockerHub
FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    libffi-dev \
    libssl-dev \
    gcc \
    make \
    && rm -rf /var/lib/apt/lists/*

# Install the Python dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /app/requirements.txt

# Copy the application code
COPY . /app/

# Set the working directory
WORKDIR /app

# Expose port (example for a web app)
EXPOSE 8080

# Command to run the app (adjust for your application)
CMD ["python", "main.py"]
