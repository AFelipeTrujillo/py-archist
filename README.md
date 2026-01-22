# Python Archist

![Version](https://img.shields.io/badge/version-v1.0.0-blue.svg)
[![Python Version](https://img.shields.io/badge/python-3.8%2B-777bb4.svg)](https://www.python.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Clean Architecture](https://img.shields.io/badge/Architecture-Clean%20%2F%20Hexagonal-green.svg)](#project-structure)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-brightgreen.svg)](https://github.com/AFelipeTrujillo/py-archist/graphs/commit-activity)

Archist is a lightweight bash utility designed to scaffold **Clean Architecture** directory structures for Python projects in seconds. It organizes your code into layers, making it decoupled, testable, and easy to maintain.

## Directory Tree

The project is organized into layers following the Archist philosophy:

```text
src/
├── Application/        # Application services and use cases
│   ├── DTO/           # Data Transfer Objects
│   ├── Service/       # Domain-independent services
│   └── UseCase/       # Orchestration of domain logic
├── Domain/            # Enterprise/Business logic (Pure Python)
│   ├── Entity/        # Domain models
│   ├── Exception/     # Domain-specific errors
│   ├── Repository/    # Port definitions (Interfaces)
│   └── ValueObject/   # Immutable data structures
├── Infrastructure/     # External tools and technical details
│   ├── Delivery/      # Entry points (Http/FastAPI, Console)
│   ├── ExternalApi/   # Third-party integrations
│   └── Persistence/   # Database implementations (Adapters)
└── Shared/            # Logic shared across all layers

```

## Key Features

* **Framework Agnostic**: The core logic does not depend on external frameworks.
* **Dependency Inversion**: High-level modules (Domain) do not depend on low-level modules (Infrastructure).
* **Environment Configuration**: Ready for `.env` management using `python-dotenv`.
* **Modern Python Tooling**: Uses `pyproject.toml` for dependency management and `pytest` for testing.
* **Type Hinting**: Encourages the use of Python type hints for better IDE support and error catching.

## Usage

### Prerequisites

* Python 3.8 or higher.
* Pip (Python package installer).

### Installation

#### 1. **Download the script**

You can download the initialization script directly from the repository using `curl`:

**Using curl:**
```bash
curl -O https://raw.githubusercontent.com/AFelipeTrujillo/py-archist/main/py_archist.sh
```

#### 2. **Set Execution Permissions**

Before running the script, you must grant it execution permissions:

```bash
chmod +x py_archist.sh
```

#### 3. **Run the Scaffolding Tool**

Execute the script in the directory where you want to start your new project:
```bash
./py_archist.sh
```

#### 4. **Install dependencies**:

```bash
pip install .

```

## Development

### Running the Application

The entry point of the application is `main.py`:

```bash
python main.py

```

### Running Tests

The project is configured to work with `pytest`:

```bash
pytest

```

## Layers Philosophy

### Domain

The "heart" of the software. It contains the business rules. It should have no dependencies on any external library or framework.

### Application

Orchestrates the flow of data to and from the domain entities. It contains the Use Cases of the system.

### Infrastructure

This layer contains the implementation of the ports defined in the Domain. It is where the database code, API clients, and the web framework (like FastAPI or Flask) live.

---

*Inspired by the [php-archist](https://github.com/AFelipeTrujillo/php-archist) project.*
