FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Avoid warnings by switching to non-interactive
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install User's System Dependencies
RUN apt-get update && apt-get install -y \
    zip g++ gcc git curl wget nasm yasm libgtk-3-dev clang libxcb-randr0-dev libxdo-dev \
    libxfixes-dev libxcb-shape0-dev libxcb-xfixes0-dev libasound2-dev libpulse-dev cmake make \
    libclang-dev ninja-build libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libpam0g-dev \
    python3 python3-pip python-is-python3 pkg-config \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# 2. Setup VCPKG (Global Install)
# We install to /usr/local/vcpkg and give ownership to the 'vscode' user
ENV VCPKG_ROOT=/usr/local/vcpkg
ENV PATH="${VCPKG_ROOT}:${PATH}"

RUN git clone https://github.com/microsoft/vcpkg ${VCPKG_ROOT} \
    && cd ${VCPKG_ROOT} \
    && git checkout 2023.04.15 \
    && ./bootstrap-vcpkg.sh \
    && chown -R vscode:vscode ${VCPKG_ROOT}

# 3. Install Flutter
ENV FLUTTER_HOME=/usr/local/flutter
ENV PATH="${FLUTTER_HOME}/bin:${PATH}"

RUN git clone https://github.com/flutter/flutter.git ${FLUTTER_HOME} -b stable \
    && chown -R vscode:vscode ${FLUTTER_HOME} \
    && git config --global --add safe.directory ${FLUTTER_HOME}

# 4. Install Rust (switch to vscode user so it installs to ~/.cargo)
USER vscode
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/vscode/.cargo/bin:${PATH}"