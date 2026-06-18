# Use a stable Rust image
FROM rust:1.75-slim

# Install system dependencies required for building Rust/Soroban projects
RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy the Cargo configuration files
COPY Cargo.toml ./

# (Optional) If you have a Cargo.lock, copy it here
# COPY Cargo.lock ./

# Copy the rest of the source code
COPY . .

# Default command: keep the container running for interactive development
CMD ["cargo", "build"]