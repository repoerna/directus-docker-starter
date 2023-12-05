# About This Project

This is a Directus project starter using Docker to facilitate a seamless development experience within the team.

# Project Stack

- Directus 10.8.2
- Docker
- Docker Compose

# How To Use

## Setup your own database

```bash
docker run -d --name <container-name> -e POSTGRES_PASSWORD=<postgres-password> -p 5432:5432 postgres:latest
```

## Build image

By default, this image will install the following extensions:

- directus-extension-document-interface
- directus-extension-currency-interface
- directus-extension-compute-interface

If you are not using any of them, delete the corresponding lines from the Dockerfile and then run:

```bash
docker-compose build
```

## Copy env file

```
cp .env.example .env
```

Update the .env file with your database configuration.

## Run the container

```
docker-compose up -d
```

If you using new database, Directus Image will automatically run bootstrap command to create the table needed by Directus.

# Development

## Schema snapshot

### Generate schema

If you are developing a collection locally and want to update your Directus instance in production, you need to obtain your local schema by executing:

```
make create-snapshot
```

This uses Directus CLI tools to generate a schema snapshot, saving it to `./snapshot/current.yml`.

### Apply schema

- TODO: Create a Make command to apply the snapshot.
- TODO: Implement in CI/CD.

### Backup schema

```
make create-backup-snapshot
```

This generates a file `./snapshot/<date>_snapshots_<timestamp>.yml.`

- TODO: Implement in CI/CD

## Database snapshot

Currently, new collection items, flows, panels, roles, and permission data are handled manually by dumping the data and importing it into the database.

Here are some community discussions about database snapshots:

- https://github.com/directus/directus/discussions/17495
- https://github.com/directus/directus/discussions/13041

And some alternative solution:

- https://github.com/CodingButter-LLC/directus-migrator
- https://github.com/tractr/directus-sync

## New image or file assets

Any file uploaded through Directus will be placed in the uploads folder and listed in the directus_file table. Any folder in Directus file management is only recorded in the database, not as a concrete folder.

If there are any asset files used in the project, update the .gitignore file to exclude those files. For example:

```
!/uploads/<filename>
```

Consider adapting this example based on your specific needs.
