# Use an official Python runtime as a parent image
FROM python:3.9-alpine

# Set the working directory to /app
WORKDIR /app

# Install system dependencies
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev jpeg-dev zlib-dev libpng-dev freetype-dev
# Install Pillow version 8.0.1
# RUN pip install Pillow --no-cache-dir

# Copy the requirements file into the container
COPY requirements.txt .

# Install the requirements
RUN pip install --no-cache-dir -r requirements.txt


# Copy the rest of the application code into the container
COPY . .

# Set the environment variable for Django settings module
ENV DJANGO_SETTINGS_MODULE=RESUMEBUILDER.settings

# Expose port 8000
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
