#!/bin/bash
DESTINATION=$1

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    echo "Visit https://docs.docker.com/engine/install/ for installation instructions."
    exit 1
fi

# Check if Docker Compose is installed
if command -v docker-compose &> /dev/null; then
    DOCKER_COMPOSE_CMD="docker-compose"
elif docker compose version &> /dev/null; then
    DOCKER_COMPOSE_CMD="docker compose"
else
    echo "Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
    exit 1
fi

# Clone the repository without .git
echo "Cloning repository..."
git clone --depth 1 https://github.com/minhng92/supabase-docker-compose $DESTINATION
cd $DESTINATION
rm -rf .git

# Start the containers
echo "Starting containers..."
$DOCKER_COMPOSE_CMD up -d

echo "Supabase has been started successfully!\n- URL: http://localhost:8000\n- User: supabase\n- Password: minhng.info"
