FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    wget \
    pulseaudio \
    gnupg \
    xvfb \
    x11-apps \
    dbus-x11
    # apt-get clean && \
    # rm -rf /var/lib/apt/lists/*

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
    && apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# Set up a user to run the browser
RUN useradd -m user
USER user
WORKDIR /home/user
