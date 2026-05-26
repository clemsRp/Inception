# User & Administrator Documentation

Welcome to the **Inception** infrastructure documentation. This document explains what services are served by this system stack, how to manage them, and how to verify their integrity.

---

## Provided Services

| Service Name | External Port / URI | Protocol / Access | Description |
| :--- | :--- | :--- | :--- |
| **WordPress** | `https://crappo.42.fr` | HTTPS (TLSv1.2/1.3) | Main content management website. |
| **Adminer** | `https://crappo.42.fr/adminer/` | HTTPS (Reverse Proxy) | Database control panel interface. |
| **Glances** | `https://crappo.42.fr/glances/` | HTTPS (Reverse Proxy) | Real-time container metrics monitor. |
| **Static Site** | `https://crappo.42.fr:8081` | HTTPS (Custom Port) | "Billy boy boy" showcase site. |
| **FTP Server** | Port `21` (Passive: `40000-40005`) | FTP Protocol | Core WordPress remote file manager. |

---

## Starting and Stopping the Infrastructure

All management operations must be triggered from the directory containing the root `Makefile`.

* **To start the environment**:
    ```bash
    make launch
    ```
* **To gracefully stop the environment**:
    ```bash
    make down
    ```

---

## Accessing the Administration Panels

### 1. WordPress Admin Panel
* **URL**: `https://crappo.42.fr/wp-admin`
* **Credentials**: The administrator user details are configured inside your private `secrets/credentials.txt` file.

### 2. Adminer Database Login
* **URL**: `https://crappo.42.fr/adminer/`
* **System**: MySQL
* **Server**: `mariadb`
* **Username**: `crappo` (or root)
* **Password**: Read directly from `secrets/db_password.txt` (or `db_root_password.txt`).

---

## Managing and Locating Credentials

For high security, absolute passwords are **never** hardcoded. They are stored locally outside of the Git tree in the following files:
* `secrets/db_root_password.txt` — Root user password for MariaDB.
* `secrets/db_password.txt` — Regular app database user password.
* `secrets/credentials.txt` — Environment setups for WordPress administrative account and FTP users.

> **Warning**: Never push the `secrets/` folder or `.env` files to public git repositories.

---

## Verifying System Health

To confirm that all services are executing flawlessly, run:
```bash
docker compose -f srcs/docker-compose.yml ps
```
