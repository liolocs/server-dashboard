# 🚀 Server Dashboard

## 📋 Overview

Server Dashboard is an open-source project aimed at providing a superior alternative to the "Dashboard" project. While the original Dashboard project relied on modifying JSON files, Server Dashboard leverages the power of PayloadCMS to offer a more user-friendly and flexible admin dashboard experience.

## 🌟 Key Features

- 🖥️ Intuitive admin interface powered by PayloadCMS
- 🔧 Easy customization through the admin dashboard
- 🚀 Docker-based development environment
- 🔒 Secure and scalable architecture

## 🚀 Getting Started

### Prerequisites

- Docker and Docker Compose
- Node.js (v18 or later recommended)
- Yarn package manager

### Setting Up Your Development Environment

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/server-dashboard.git
   cd server-dashboard
   ```

2. Set up your environment variables:
   - Copy the `.env.example` file to `.env`:
     ```
     cp .env.example .env
     ```
   - Open the `.env` file and update the variables as needed. Pay special attention to:
     ```
     PAYLOAD_SECRET=your_secret_here
     POSTGRES_DB=payloadcms
     POSTGRES_USER=payloaduser
     POSTGRES_PASSWORD=payloadpass
     ```

3. Start the development server using Docker Compose:
   ```
   docker-compose up
   ```

4. Once the services are up and running, you can access:
   - The frontend application at `http://localhost:3000`
   - The PayloadCMS admin dashboard at `http://localhost:3000/admin`

## 🚀 Deploying with Coolify

To deploy this project using Coolify:

1. Set up a new project in Coolify pointing to this repository.
2. In the Coolify dashboard, set the following environment variables:
   - `PAYLOAD_SECRET`: A secure random string for PayloadCMS
   - `PAYLOAD_PUBLIC_SERVER_URL`: The public URL of your server
   - `POSTGRES_DB`: The name of your PostgreSQL database
   - `POSTGRES_USER`: The username for your PostgreSQL database
   - `POSTGRES_PASSWORD`: The password for your PostgreSQL database
   - `NEXT_PUBLIC_SERVER_URL`: The public URL of your server (same as PAYLOAD_PUBLIC_SERVER_URL)
3. Deploy the project using the `docker-compose.production.yml` file.

Coolify will inject these environment variables into your containers at runtime, ensuring a secure and flexible deployment process.

## 🤝 Contributing

We welcome contributions from the community! Please see our [Contributing Guide](CONTRIBUTING.md) for more details on how to get involved.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgements

- PayloadCMS team for their excellent CMS framework
- All contributors and supporters of the project