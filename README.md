# ft_onion

**Tor** (The Onion Router) is a network used to ensure online privacy and anonymity for internet users. Tor allows users to browse the internet anonymously, allowing IP addresses to be hidden. Devices connected to the Tor network route internet traffic through multiple nodes, ensuring that the user's true identity and location remain hidden.

The term **Onion** is a name associated with the Tor network. Sites hosted on the Tor network can be accessed by URLs with the `.onion` extension. These sites are specific to the Tor network and can only be accessed with the Tor Browser. `.onion` sites are private domains used to provide anonymity and security.

---

## About the Project

This project aims to run a web server on the Tor network. The web server will host a page pointing to a static `index.html` file and this page will be accessible on the Tor network via a URL with the extension `xxxxxxxxx.onion`. The project will use Nginx web server and no other web server or framework will be used. In addition, SSH access will be provided and settings specific to the Tor network will be made.

---

#### Requirements

- **Docker**: Docker will be used to run the project.
- **Tor Browser**: Tor Browser is required to connect to the Tor network.
  
---

## Installation Stages

1. **Download Docker for Windows**  
   Download and install Docker [from the official site](https://www.docker.com/get-started).

      1.1 **Download Docker for Linux**  
   ```bash
   sudo apt install docker.io docker-compose -y
   ```

2. **Download Tor Browser**  
   Download and install Tor Browser [from the official site](https://www.torproject.org/download/).

3. **Download Project Files**  
    ```bash
    git clone https://github.com/whymami/ft_onion.git
    ```

4. **Start Docker services**  
   Using Docker, run the following commands:
   ```bash
   docker-compose up -d
   ```

5. **Your .onion extension link is ready**
