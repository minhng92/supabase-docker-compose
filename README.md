# SELF-HOSTING SUPABASE WITH DOCKER

This repository provides a pre-configured Docker Compose setup for [Supabase](https://github.com/supabase/supabase), allowing developers to quickly deploy a full Supabase stack locally with minimal configuration. The default settings enable immediate use of all Supabase features (auth, database, storage, functions) without needing to manually configure each component.

**Supabase** is a powerful, open-source backend platform that simplifies the development of modern web and mobile applications. It offers a wide range of features such as authentication, real-time database, storage, and edge functions, all in a single package.

# INSTALLATION
To quickly install Supabase using Docker Compose, run:

```bash
curl -s https://raw.githubusercontent.com/minhng92/supabase-docker-compose/master/run.sh | bash -s my-supabase
```

Replace `my-supabase` with your desired destination folder.

Then open Supabase Studio at http://localhost:8000 and log in with the following credentials:
- Username: supabase
- Password: minhng.info (default password)

# SERVICES

## Checkpoints

This repository maintains snapshots of previous versions in the `checkpoints` directory. As the repository undergoes periodic updates, these historical checkpoints provide access to earlier configurations and component versions for reference or compatibility purposes.

| Checkpoint  | supabase/studio | kong | supabase/gotrue | postgrest/postgrest | supabase/realtime | supabase/storage-api | darthsim/imgproxy | supabase/postgres-meta | supabase/edge-runtime | supabase/logflare | supabase/postgres | timberio/vector | supabase/supavisor |
|-------------|----------------|------|-----------------|---------------------|-------------------|---------------------|-------------------|------------------------|----------------------|-------------------|-------------------|------------------|-------------------|
| 2025-03-22 (current)  | 20250224-d10db0f | 2.8.1 | v2.170.0 | v12.2.8 | v2.34.40 | v1.19.3 | v3.8.0 | v0.86.1 | v1.67.2 | 1.12.5 | 15.8.1.049 | 0.28.1-alpine | 2.4.12 |

## Available API Endpoints

Supabase provides several API endpoints that are accessible at `localhost:8000`:

- **REST API**: http://localhost:8000/rest/v1/
- **Authentication**: http://localhost:8000/auth/v1/
- **Storage**: http://localhost:8000/storage/v1/
- **Realtime**: http://localhost:8000/realtime/v1/
- **Edge Functions**: http://localhost:8000/functions/v1/[function-name]

## Adding Custom Edge Functions

To create a new edge function:

1. Place your TypeScript code in `volumes/functions/[function-name]/index.ts`
2. Apply changes by restarting only the functions service:
   ```bash
   docker compose restart functions --no-deps
   ```

# Environment Setup

Supabase requires proper environment configuration to function correctly. This section covers how to set up your environment variables and configuration files for both development and production deployments. Proper environment setup ensures security, performance, and compatibility across different hosting scenarios.

## Development Environment
For testing or local development, run the following command in your project directory:

```bash
docker compose up -d
```

This will start all Supabase services in detached mode.

## Production Environment
Before deploying to production:
1. Make a copy of the sample .env file if you haven't already
2. Edit the .env file to replace all default "minhng.info" values with your own domain and credentials
3. Configure secure passwords, API keys, and JWT secrets
4. Set appropriate environment-specific variables for scaling and performance

Never use the default credentials in a production environment as this poses significant security risks.
