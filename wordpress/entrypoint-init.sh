#!/usr/bin/env bash
set -euo pipefail

if [ -z "$(ls -A /var/www/html || true)" ]; then
  echo "[init] Seeding /var/www/html from /usr/src/wordpress ..."
  tar -C /usr/src/wordpress -cf - . | tar -C /var/www/html -xf -
  chown -R www-data:www-data /var/www/html
fi

exec docker-entrypoint.sh apache2-foreground
