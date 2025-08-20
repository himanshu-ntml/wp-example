# WordPress + MySQL (Custom PHP) — Docker Starter

This repo builds your own WordPress image (from `wordpress/Dockerfile`) and bakes in your PHP overrides from `wordpress/php/conf.d/zzz-custom.ini`.  
Uploads persist to a volume; your code/config ship with the image so they don't get shadowed by a full `/var/www/html` bind mount.

## Files
- `docker-compose.yml` — Build from local `wordpress/` and run MySQL 8.
- `wordpress/Dockerfile` — Extends official image; copies PHP `.ini` and optional code.
- `wordpress/php/conf.d/zzz-custom.ini` — Your PHP overrides (edit as you like).
- `.env.example` — Copy to `.env` and set secrets.
- `compose.full-html.yml` — Optional mode that keeps a full `/var/www/html` volume. Includes an init entrypoint to seed the volume the first time.
- `wordpress/entrypoint-init.sh` — Seeds `/var/www/html` for the full-volume mode.
- `.dockerignore` — Keeps the build lean.

## Quick start
```bash
cp .env.example .env            # then edit values
docker compose build
docker compose up -d
```

Then open the site at the hostname you map to the container (e.g., http://localhost:8080 if you publish port 80).

## Why only mount uploads?
Mounting a full `/var/www/html` volume will hide whatever you baked in the image (including your PHP `.ini`). Mounting only `wp-content/uploads` gives you persistence for media without masking config.

If you really need a full `/var/www/html` volume (e.g., you edit code live), use `compose.full-html.yml`:
```bash
docker compose -f compose.full-html.yml up -d --build
```
