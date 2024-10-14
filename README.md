# 🚀 Server Dashboard

## 📋 Overview

Server Dashboard is an open-source project to allow you to create a simple dashboard to manage your server. It aims to provide a simpler experience to the popular open source "Dashboard" project while leveraging the power of PayloadCMS, allowing you to modify your page using the admin dashboard available at the /admin route.

## 🌟 Key Features

- 🖥️ Intuitive admin interface powered by PayloadCMS
- 🔧 Easy customization through the admin dashboard
- 🚀 Docker-based development environment
- 🔒 Secure and scalable architecture

## 🚀 Getting Started

### Prerequisites for development

- Docker and Docker Compose
- Node.js (v18 or later recommended)

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
   - Open the `.env` file and update the variables as needed.
     ```
     PAYLOAD_SECRET=your_secret_here
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

1. Set up a new project in Coolify using docker-compose empty file
2. Copy paste the content of `docker-compose.yml` into the Coolify project
3. Click the settings icon on the service to set your domain to deploy to
4. Hit save
5. Update the environment variables with your own values
6. Hit Deploy

## 🤝 Contributing

We welcome contributions from the community! Please see our [Contributing Guide](CONTRIBUTING.md) for more details on how to get involved.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgements

- PayloadCMS team for their excellent CMS framework
