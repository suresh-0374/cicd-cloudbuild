# Step 1: Use the official lightweight Python image
FROM python:3.11-slim

# Step 2: Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Step 3: Set the working directory in the container
WORKDIR /app

# Step 4: Install dependencies
# We copy this first to leverage Docker's cache layers
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the local code to the container
COPY . .

# Step 6: Start the application using Gunicorn
# $PORT is an environment variable provided by GCP at runtime
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
