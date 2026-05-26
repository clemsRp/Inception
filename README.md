*This project has been created as part of the 42 curriculum by crappo.*

## Description
This project, **Inception**, aims to broaden system administration knowledge by using Docker. The goal is to build a complete, secure infrastructure composed of several services running inside dedicated, custom-built containers using `docker-compose`. All images are built from scratch using the penultimate stable version of Debian (Bullseye) to ensure a fully mastered deployment process.

### Features & Infrastructure Overview
The stack includes the following components:
* **NGINX**: The unique entrypoint via port 443 with strict TLSv1.2/TLSv1.3 compliance.
* **WordPress + PHP-FPM**: Pre-configured WordPress environment running via PHP-FPM on port 9000.
* **MariaDB**: Isolated database management system running on port 3306.
* **Redis Cache**: Bonus service integrated with WordPress to dramatically reduce load times.
* **Adminer**: Bonus database management interface accessible via a secure reverse proxy route (`/adminer`).
* **FTP Server**: Bonus vsftpd container mapped directly to the WordPress volume for external asset management.
* **Static Website**: Bonus lightweight standalone site showcasing **"Billy boy boy"** running on port 8081 with SSL.
* **Glances**: Bonus real-time system monitoring panel available securely via `/glances/`.

---

## Instructions

### Prerequisites
* A Virtual Machine running a Linux environment.
* `docker` and `docker-compose-plugin` installed.

### Execution
A root-level `Makefile` is available to safely manage the infrastructure:

* **Build and start everything**:
    ```bash
    make launch
    ```
* **Build and start everything without using the cache**:
    ```bash
    make launch_no_cache # Takes more time than make launch
    ```

---

## Technical Comparisons & Design Choices

### Virtual Machines vs Docker
* **Virtual Machines (VMs)** virtualize the entire underlying hardware, requiring a full guest Operating System (OS). This consumes significant RAM and CPU overhead.
* **Docker** virtualizes at the OS/Kernel level. Containers share the host kernel, making them lightweight, isolating processes efficiently, and booting almost instantaneously.

### Secrets vs Environment Variables
* **Environment Variables (`.env`)** are highly dynamic and perfect for public configuration layout (e.g., domain names, service names). However, they can be leaked via process inspection (`docker inspect`).
* **Docker Secrets** inject confidential details (passwords, private keys) dynamically into the container runtime memory (`/run/secrets/`). They are never recorded in images, environment dumps, or git history.

### Docker Network vs Host Network
* **Host Network** attaches the container directly to the host's networking stack, eliminating isolation and creating critical port collision vulnerabilities.
* **Docker Network (Bridge)** creates an private virtual switch network. It allows our containers to securely interact with each other using internal DNS resolution while restricting external visibility solely to specified ports (such as port 443).

### Docker Volumes vs Bind Mounts
* **Bind Mounts** point to an absolute path on the host system, making the containers tightly coupled with the host directory structure.
* **Docker Named Volumes** are managed explicitly by the Docker daemon engine. In this project, we use native `local` driver options to explicitly direct the volumes to persist securely inside `/home/crappo/data/` for data persistence.

---

## Resources
* [Docker Documentation](https://docs.docker.com/)
* [Debian Bullseye Packages Reference](https://www.debian.org/distrib/packages)
* [WordPress CLI Handbook](https://make.wordpress.org/cli/handbook/)

### AI Use Disclosure
AI was principaly used for understand key concepts via short tutorials or videos using notebooklm.

AI tools were also utilized to streamline development:
* **Tasks assisted**: Generating boilerplate structure for `vsftpd` rulesets.
* **Verification method**: Manual verification through debugging, step-by-step peer testing sessions during mock evaluations, and runtime logs checks using `docker compose logs`.
