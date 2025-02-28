# OpenTeams

An integrated open-source collaboration platform for teams and organizations.

## Overview

OpenTeams is a comprehensive workspace solution that helps companies integrate various open-source collaboration tools into a unified environment. It provides an easy-to-deploy system requiring minimal effort to set up a complete team collaboration suite.

## Features

- 🔐 **Centralized Authentication** via OpenLDAP
- 💬 **Team Chat** via Rocket.Chat
- 🎯 **Task Management** with Wekan kanban boards
- 📁 **File Storage & Collaboration** through Nextcloud
- 📹 **Video Conferencing** powered by Jitsi Meet
- 🌐 **Unified Gateway** with Nginx Proxy Manager
- 🏠 **Custom Homepage** for easy service navigation

## Requirements

- Docker and Docker Compose
- At least 4GB RAM
- 20GB disk space (minimum)
- Linux-based OS (Ubuntu/Debian recommended)

## Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/rtzgod/openteams.git
cd openteams
```
### 2. Create environment file 
```bash
cp env.example .env
```
Edit the .env file to configure various aspects of the system:

LDAP settings (organization name, admin password)\
Service URLs\
Database credentials\
Jitsi configuration
### 3. Create configuration directories and generate secure passwords for Jitsi
```bash
make jitsi_dir
```
```bash
bash gen-passwords.sh
```
### 4. Start services
```bash
docker compose up -d
```
### 5. Access Nginx Proxy Manager
Open http://your-server-ip:81 in your browser and configure proxy hosts for each service.

Default login:\
Email: admin@example.com\
Password: changeme

Configure these domains in Nginx Proxy Manager to point to the appropriate services:

Homepage: http://openteams.yourdomain.com\
Chat: http://chat.yourdomain.com (RocketChat)\
Kanban: http://wekan.yourdomain.com (Wekan)\
Cloud: http://cloud.yourdomain.com (Nextcloud)\
Meet: http://meet.yourdomain.com (Jitsi)\
LDAP: ldap.yourdomain.com (Port 389)

## Component Services
### Nginx Proxy Manager (NPM)
NPM serves as the gateway to all OpenTeams services, managing:

- SSL certificates (Let's Encrypt integration)
- Domain routing
- HTTP/HTTPS access
#### OpenLDAP
Central authentication server that enables single sign-on across services:

- Access at port 389
- Manage users and groups
### RocketChat
Team messaging platform:

- Integrates with LDAP for authentication
- Supports channels, direct messages, and file sharing
### Wekan
Kanban board for task management:

- Create boards and cards
- Assign tasks and track progress
- LDAP integration for team management
### Nextcloud
File storage and collaboration suite:

- Document editing and sharing
- Calendar and contacts
- Integrated with LDAP
### Jitsi Meet
Video conferencing platform:

- No account required for participants
- Screen sharing and recording
- HD video and audio
## Directory Structure

.\
├── .env                  # Environment variables\
├── docker-compose.yml    # Main service definition\
├── env.example           # Example configuration\
├── gen-passwords.sh      # Password generator for Jitsi\
├── homepage/             # Custom homepage files\
├── jitsi-meet-cfg/       # Jitsi configuration\
├── Makefile              # Helper commands\
└── services/             # Individual service configurations\

## License
This project is licensed under the MIT License.