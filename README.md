# Python Archist

A clean architecture boilerplate for Python projects, inspired by the hexagonal architecture (Ports and Adapters) pattern. This project provides a solid foundation for building maintainable, scalable, and testable applications by decoupling core business logic from technical implementation details.

## Project Structure

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

## Getting Started

### Prerequisites

* Python 3.8 or higher.
* Pip (Python package installer).

### Installation

1. **Activate the virtual environment**:
```bash
source .venv/bin/activate  # Linux/macOS
# or
.venv\Scripts\activate     # Windows

```


2. **Install dependencies**:
```bash
pip install .

```


3. **Setup environment variables**:
```bash
cp .env.example .env

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