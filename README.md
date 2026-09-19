# nc-infra

Nursery Infrastructure - Quarkus-based microservice for Nursery Management System database and infrastructure setup.

## Features

- **Flyway Migrations** - Database schema versioning and management
- **PostgreSQL** - Primary database
- **Prometheus** - Metrics collection and monitoring
- **Quarkus** - Fast, lightweight Java framework

## Structure

- **src/main/resources/db/migration/** - Database schema migrations
- **src/main/resources/db/seed/** - Database seed data

## Building

```bash
mvn clean install
```

## Running

```bash
mvn quarkus:dev
```

## Database Configuration

Default PostgreSQL connection:
- URL: `jdbc:postgresql://localhost:5432/nursery_db`
- User: `postgres`
- Password: `postgres`

Override in `application.properties` or environment variables.

## Running Migrations

Migrations are automatically applied on application startup. To run migrations manually:

```bash
mvn flyway:migrate
```

## Dependencies

- Quarkus
- Flyway
- PostgreSQL JDBC Driver
- Micrometer (Metrics)
- Prometheus Registry
