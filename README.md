# 🚀 Server Dashboard

## 📋 Overview

Server Dashboard is an open-source project aimed at providing a superior alternative to the "Dashboard" project. While the original Dashboard project relied on modifying JSON files, Server Dashboard leverages the power of PayloadCMS to offer a more user-friendly and flexible admin dashboard experience.

## 🌟 Key Features

- 🖥️ Intuitive admin interface powered by PayloadCMS
- 🔧 Easy customization through the admin dashboard
- 🚀 Docker-based development environment
- 🐳 Simple deployment on Coolify using Docker Compose

## 🚀 Getting Started

### Prerequisites

- Docker and Docker Compose
- Node.js (v18 or later recommended)
- Yarn package manager

### Running in Development Mode

1. Clone the repository:
   ```
   git clone https://github.com/liolocs/server-dashboard.git
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

## 🤝 Contributing

We welcome contributions from the community! Please see our [Contributing Guide](CONTRIBUTING.md) for more details on how to get involved.

## 📄 License

This project is licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgements

- PayloadCMS team for their excellent CMS framework
- All contributors and supporters of the project