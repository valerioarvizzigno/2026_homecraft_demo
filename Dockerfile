# Use an official lightweight Python image
FROM python:3.10-slim

# Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install system dependencies (often needed for vector DB libraries or compilers)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN edot-bootstrap --action=install

# Copy the rest of the application code
COPY . .

# Expose the port Cloud Run will use
EXPOSE 8080

# Run the Streamlit app on port 8080
CMD ["sh", "-c", "streamlit run home.py --server.port=${PORT:-8080} --server.address=0.0.0.0"]