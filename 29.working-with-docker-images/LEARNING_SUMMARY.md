# Learning Summary: Working with Docker Images

This document summarizes the key concepts, commands, and practical skills learned in the "Working with Docker Images" project.

## Key Concepts

*   **Docker Images**: Lightweight, portable packages containing everything needed to run an application (code, runtime, libraries, etc.).
*   **Docker Hub**: A cloud-based registry for hosting searching, and sharing Docker images.
*   **Dockerfile**: A text document containing all the commands a user could call on the command line to assemble an image.

## Commands Mastered

| Command | Description |
| :--- | :--- |
| `docker search <term>` | Search for images on Docker Hub. |
| `docker pull <image>` | Download an image from Docker Hub to the local machine. |
| `docker images` | List all images stored locally on the machine. |
| `docker build -t <name> .` | Build a Docker image from a Dockerfile in the current directory. |
| `docker run -p <host_port>:<container_port> <image>` | Run a container from an image, mapping ports. |
| `docker tag <image> <repo>/<image>:<tag>` | Tag an image into a target repository/tag (required for pushing). |
| `docker login` | Authenticate with a Docker registry (like Docker Hub). |
| `docker push <repo>/<image>:<tag>` | Upload an image to a registry. |

## Practical Implementation

### 1. Working with Existing Images
*   Searched for and pulled the official `ubuntu` image from Docker Hub.
*   Verified the image download using `docker images`.

### 2. Building a Custom Nginx Image
*   Created a `Dockerfile` using `nginx:latest` as the base image.
*   The Dockerfile configuration:
    *   Set the working directory to `/usr/share/nginx/html/`.
    *   Copied a local `index.html` file into the container.
    *   Exposed port 80.
*   Built the custom image using `docker build`.

### 3. Running and Testing
*   Ran the custom container mapping port `8080` on the host to port `80` on the container.
*   (If on AWS) Configured Security Groups to allow inbound traffic on port 8080.
*   Verified the web server was running by accessing the public IP on port 8080.

### 4. Distribution
*   Tagged the custom image for Docker Hub.
*   Logged into Docker Hub via the CLI.
*   Pushed the tagged image to a public repository for sharing and collaboration.
