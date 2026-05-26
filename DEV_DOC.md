# Developer & Maintainer Documentation

This engineering log tracks setup specifications, architecture workflows, and diagnostic parameters for the **Inception** infrastructure.

---

## Environment Initialization from Scratch

### 1. File Structure Setup
Ensure your local tree mirrors this structural scheme:
```text
.
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
```

# 2. Environment Variables Configuration
Create a srcs/.env tracking file specifying non-secret configuration variables:

```bash
DOMAIN_NAME=crappo.42.fr
WORDPRESS_DATABASE=inception_database
WORDPRESS_ADMIN_EMAIL=crappo@student.42lyon.fr
WORDPRESS_USER=crappo
WORDPRESS_USER_EMAIL=crappo@student.42lyon.fr
FTP_USER=crappo

# SSL Self-signed generation payload variables
COUNTRY=FR
STATE=Auvergne-Rhone-Alpes
LOCALITY=Lyon
ORGANIZATION=42
ORGANIZATION_UNIT=crappo
COMMON_NAME=crappo.42.fr
USER_ID=crappo
```

# Build and Launch Mechanics
The lifecycle compilation relies on docker compose build contexts:

```bash
# Force fresh compliance images compilation without cache layer anomalies
make launch_no_cache
```

### PID 1 and Foreground Execution
[cite_start]To comply with standard container requirements and prevent premature shutdown, all services avoid background daemonization hacks[cite: 97, 102, 103, 105]:
* **NGINX** runs via `daemon off;` to remain bound to PID 1.
* **PHP-FPM** is executed with the `-F` flag to enforce foreground execution.
* **MariaDB** utilizes `exec mysqld_safe` initialized after passing initial shell configuration steps.
* **Redis** runs with `--daemonize no`.

---

## Storage Architecture and Persistence Mapping

[cite_start]Data state persistence is handled via custom `local` volumes defined explicitly in `srcs/docker-compose.yml`[cite: 90]. [cite_start]These local engine parameters link path mappings onto the host filesystem[cite: 91, 109]:

* [cite_start]**MariaDB engine storage**: `/home/crappo/data/mariadb` $\rightarrow$ internal container path `/var/lib/mysql` [cite: 91]
* [cite_start]**WordPress files storage**: `/home/crappo/data/wordpress` $\rightarrow$ internal container path `/var/www/wordpress` [cite: 91]
* **SSL Encryption volume**: `/home/crappo/data/ssl` $\rightarrow$ distributed internally to NGINX and the static site.

---

## Useful Development Tools & Diagnostics

### Inspecting Running Live Stream Logs
```bash
docker compose -f srcs/docker-compose.yml logs -f [service_name]
```