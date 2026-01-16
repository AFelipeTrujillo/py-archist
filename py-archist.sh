#!/bin/bash

# User input for pyproject.toml
read -p "Project Name [python-archist]: " INPUT_NAME
PROJECT_NAME=${INPUT_NAME:-"python-archist"}

read -p "Version [0.1.0]: " INPUT_VERSION
VERSION=${INPUT_VERSION:-"0.1.0"}

read -p "Description [Clean Architecture project in Python]: " INPUT_DESC
DESCRIPTION=${INPUT_DESC:-"Clean Architecture project in Python"}

# Ask for Virtual Environment creation
read -p "Do you want to create a virtual environment (.venv)? (y/n): " CREATE_VENV

# Create Source Folders
mkdir -p src/Application/{DTO,Service,UseCase}
mkdir -p src/Domain/{Entity,Exception,Repository,ValueObject}
mkdir -p src/Infrastructure/{Delivery/Console,Delivery/Http,ExternalApi,Persistence}
mkdir -p src/Shared

# Create Test Folders
mkdir -p tests/{Integration,Unit}

# Create __init__.py files for all packages
find src -type d -exec touch {}/__init__.py \;
find tests -type d -exec touch {}/__init__.py \;

# Create pyproject.toml
cat <<EOF > pyproject.toml
[project]
name = "$PROJECT_NAME"
version = "$VERSION"
description = "$DESCRIPTION"
dependencies = [
    "python-dotenv>=1.0.0",
    "pydantic>=2.0.0"
]

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["src"]
EOF

# Create .env and .env.example
touch .env
cat <<EOF > .env.example
DATABASE_URL=postgresql://user:password@localhost:5432/db
API_KEY=your_api_key_here
EOF

# Create .gitignore
cat <<EOF > .gitignore
__pycache__/
*.py[cod]
.venv/
venv/
.env
.pytest_cache/
.coverage
EOF

# Create main.py
cat <<EOF > main.py
import os
from dotenv import load_dotenv

def main():
    load_dotenv()
    print("Environment variables loaded for $PROJECT_NAME.")

if __name__ == "__main__":
    main()
EOF

# Virtual Environment Logic (Direct version)
if [[ "$CREATE_VENV" =~ ^[Yy]$ ]]; then
    echo "Creating virtual environment using python3..."
    python3 -m venv .venv
    echo "Virtual environment created. To activate it, use: source .venv/bin/activate"
fi

echo "Project $PROJECT_NAME has been initialized in the current directory."